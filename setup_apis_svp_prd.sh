## Test if you need to login to your GCP account, use this...
gcloud auth list 2>&1 | grep '*       mattpursley@improbable.io' || (echo "Error: gcloud auth needs to be set to mattpursley@improbable.io" ; gcloud auth login)

## Use this to choose your GCP/GKE Cluster
kubectx gke_svp-tst-47c6_europe-west4_svp-tst-game-gcp-europe-west4-5

## Use this to connect to the Kubernetes API...
kubectl proxy --port=8080 &

## Use this to connect to the Prometheus API...
kubectl port-forward -n imp-metrics prometheus-cluster-0 6003:9090 &

## Use this to test that you can connect to the Kubernetes and Prometheus APIs...
echo curl "http://localhost:8080/api/v1/nodes" \| less
# curl 'http://localhost:6003/api/v1/query_range?query=sum(rate(node_network_receive_bytes_total\[5m\]))&start=2021-12-25T01:00:00Z&end=2021-12-27T01:00:00Z&step=30m'| less
