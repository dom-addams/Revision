import React, { useState, useEffect } from "react";
import { Configmap, Pod } from "@kubernetes/client-node";

const App = ({ configmapNames, podLabels }) => {
  const [configmaps, setConfigMaps] = useState([]);
  const [pods, setPods] = useState([]);

  useEffect(() => {
    // Get all configmaps
    const configmapClient = new Configmap();
    configmapClient.list().then((configmaps) => {
      setConfigMaps(configmaps);
    });

    // Get all pods
    const podClient = new Pod();
    podClient.list({
      labelSelector: `app=${podLabels}`,
    }).then((pods) => {
      setPods(pods);
    });
  }, []);

  useEffect(() => {
    // Watch for changes to configmaps
    const configmapChanges = configmaps.filter((configmap) => {
      return configmapNames.includes(configmap.metadata.name);
    }).map((configmap) => {
      return configmapClient.watch(configmap.metadata.name).then((changes) => {
        changes.forEach((change) => {
          if (change.type === "MODIFIED") {
            // Update pods with the latest configmap values
            const podUpdates = pods.filter((pod) => {
              return podLabels.every((label) => {
                return pod.metadata.labels.hasOwnProperty(label);
              });
            }).map((pod) => {
              return {
                name: pod.metadata.name,
                spec: {
                  containers: pod.spec.containers.map((container) => {
                    return {
                      name: container.name,
                      env: container.env.map((env) => {
                        if (env.name === configmap.metadata.name) {
                          env.value = configmap.data[env.value];
                        }
                        return env;
                      }),
                    };
                  }),
                },
              };
            });
            podClient.updateMany(podUpdates).then((responses) => {
              // Successfully updated pods
            });
          }
        });
      });
    });
  }, [configmaps]);

  return (
    <div>
      <h1>Configmap Watcher</h1>
      <ul>
        {configmaps.map((configmap) => (
          <li key={configmap.metadata.name}>
            {configmap.metadata.name}
          </li>
        ))}
      </ul>
      <h1>Pods</h1>
      <ul>
        {pods.map((pod) => (
          <li key={pod.metadata.name}>
            {pod.metadata.name}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default App;