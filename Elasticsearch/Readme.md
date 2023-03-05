# Installing ELK stack services

## Useful Links
- https://logz.io/blog/configure-yaml-files-elk-stack/
- https://www.elastic.co/guide/en/beats/filebeat/current/override-filebeat-config-settings.html
- https://www.elastic.co/guide/en/elasticsearch/reference/current/settings.html
- https://medium.com/kocsistem/elk-stack-in-kubernetes-using-helm-52398564f7fc

## Installing Elasticsearch
Add the Elastic Helm charts repo: helm repo add elastic https://helm.elastic.co

Install helm chart: helm install elasticsearch elastic/elasticsearch 

Elastic docker image: docker.elastic.co/elasticsearch/elasticsearch

GitHub repo https://github.com/elastic/helm-charts/tree/main/elasticsearch

(use --version x.x.x flag to install specific release)

(extra for Minikube run: minikube addons enable default-storageclass && minikube addons enable storage-provisioner)

## Installing FluentD
Download DaemonSet: https://github.com/fluent/fluentd-kubernetes-daemonset/blob/master/fluentd-daemonset-elasticsearch.yaml

Configure Environment Variables based on elasticsearch:
- FLUENT_ELASTICSEARCH_HOST // Specify the host name or IP address // elasticsearch-logging
- FLUENT_ELASTICSEARCH_PORT // Elasticsearch TCP port // 9200

FluentD docker image: fluent/fluentd-kubernetes-daemonset:v1-debian-elasticsearch

GitHub repo https://github.com/fluent

Documentation: 
- https://docs.fluentd.org/installation/install-from-source
- https://docs.fluentd.org/v/0.12/articles/kubernetes-fluentd 
- https://www.elastic.co/blog/monitoring-kubernetes-with-the-elastic-stack-using-prometheus-and-fluentd
- https://medium.com/hepsiburadatech/fluent-logging-architecture-fluent-bit-fluentd-elasticsearch-ca4a898e28aa

## Installing Logstash
Add the Elastic Helm charts repo: helm repo add elastic https://helm.elastic.co

Install helm chart: helm install logstash elastic/logstash

Logstash docker image: docker.elastic.co/logstash/logstash

GitHub repo https://github.com/elastic/helm-charts/tree/main/logstash

Documentation: 
- https://www.elastic.co/blog/a-practical-introduction-to-logstash
- https://www.elastic.co/guide/en/logstash/current/first-event.html
- https://www.elastic.co/guide/en/logstash/current/advanced-pipeline.html

## Installing Kibana
Add the Elastic Helm charts repo: helm repo add elastic https://helm.elastic.co

Install helm chart: helm install kibana elastic/kibana

Kibana docker image: docker.elastic.co/kibana/kibana

GitHub repo https://github.com/elastic/helm-charts/tree/main/kibana

Documentation: 
- https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-deploy-kibana.html
- https://www.elastic.co/guide/en/beats/filebeat/current/setup-kibana-endpoint.html

(Kibana uses a Kubernetes Ingress to set dashboard URL)
