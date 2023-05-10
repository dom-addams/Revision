# Example CRD to watch ConfigMaps and auto-update pods

Certainly! Here's an example of a Custom Resource Definition (CRD) that can be used to watch for updates to ConfigMaps and automatically update pods with the new values:

> Useful link --> [kubernetes-clinet](https://github.com/kubernetes-client/javascript)

## Step One
First, create a file called `configmapwatcher-crd.yaml` and add the following content:

```yaml
apiVersion: apiextensions.k8s.io/v1
kind: CustomResourceDefinition
metadata:
  name: configmapwatchers.sample.com
spec:
  group: sample.com
  versions:
    - name: v1
      served: true
      storage: true
  scope: Namespaced
  names:
    plural: configmapwatchers
    singular: configmapwatcher
    kind: ConfigMapWatcher
    shortNames:
      - cmw
```
### Explanation
This CRD definition specifies a custom resource named `ConfigMapWatcher` in the `sample.com` API group. It is namespaced and has a single version `v1`.

## Step Two
Next, create a file called `configmapwatcher-controller.yaml` for the controller deployment:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: configmapwatcher-controller
spec:
  replicas: 1
  selector:
    matchLabels:
      app: configmapwatcher-controller
  template:
    metadata:
      labels:
        app: configmapwatcher-controller
    spec:
      containers:
        - name: configmapwatcher-controller
          image: your/controller-image:tag
```

> Make sure to replace `your/controller-image:tag` with the actual image of your custom controller.

## Step Three
Finally, create a file called `configmapwatcher-example.yaml` for an example instance of the CRD:

```yaml
apiVersion: sample.com/v1
kind: ConfigMapWatcher
metadata:
  name: example-configmapwatcher
spec:
  configMapName: my-configmap
  podSelector:
    matchLabels:
      app: my-app
```

In this example, the `ConfigMapWatcher` resource is created with the name `example-configmapwatcher`. It specifies a `configMapName` field with the name of the ConfigMap to watch (`my-configmap`) and a `podSelector` field to select the target pods based on label matching (`app: my-app`).

To use these files, apply them to your Kubernetes cluster:

```shell
kubectl apply -f configmapwatcher-crd.yaml
kubectl apply -f configmapwatcher-controller.yaml
kubectl apply -f configmapwatcher-example.yaml
```

Once applied, the custom controller specified in `configmapwatcher-controller.yaml` will monitor the changes to the ConfigMap specified in the `configMapName` field of the `ConfigMapWatcher` instance. When a change occurs, the controller can update the pods selected by the `podSelector` field.

Please note that the example provided here is a simplified representation, and the actual implementation of the controller logic and pod updates will depend on your specific requirements and programming language. It's recommended to refer to the official Kubernetes documentation and resources for detailed guidance on creating custom controllers and working with CRDs.