kubectl delete configmaps envoy-config-backend
kubectl apply -f envoy-config-backend.yaml
kubectl rollout restart deployment backend
kubectl logs -f deployments/backend -c envoy-sidecar