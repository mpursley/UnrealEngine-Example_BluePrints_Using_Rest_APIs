## Start Docker
open /Applications/Docker.app

## Use this to choose your docker Cluster
kubectx docker-desktop

## Use this to connect to the Kubernetes API...
kubectl  proxy --port=8080 &

## Use this to connect to the Prometheus API...
kubectl port-forward prometheus-prometheus-kube-prometheus-prometheus-0 9090:9090 &
kubectl port-forward prometheus-grafana-79885b884-rdjkb 3000:3000 &

## Use this to test that you can connect to the Kubernetes and Prometheus APIs...
# curl "http://localhost:8080/api/v1/nodes" | less
# curl "http://localhost:9090/api/v1/alerts" | jq . | less
# curl 'http://localhost:9090/api/v1/query_range?query=sum(rate(node_network_receive_bytes_total\[5m\]))&start=2021-12-25T01:00:00Z&end=2021-12-27T01:00:00Z&step=30m'| less
# curl -g 'http://localhost:6003/api/v1/query_range?query=100%20-%20(avg%20by%20(cpu)%20(irate(node_cpu{job=%22node-exporter%22,mode=%22idle%22}[5m]))*100)&start=2022-02-10T01:00:00Z&end=2022-02-14T01:00:00Z&step=5m' | jq '.data.result[0].values[0]'
# curl 'https://min-api.cryptocompare.com/data/v2/histohour?fsym=BTC&tsym=USD&limit=99' | jq . | less
