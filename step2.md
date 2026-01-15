# Step 2: Deploy to Kubernetes

## Task
Deploy the application to Kubernetes using the provided manifests. However, they contain errors!

## Examine the Manifests
```bash
cd /root/k8s
ls -la
cat deployment.yaml
cat service.yaml
```

## Your Goals
1. Fix the `deployment.yaml` file (multiple issues)
2. Fix the `service.yaml` file
3. Apply them to the cluster
4. Verify pods are running

## Common Issues to Look For
- Wrong image references
- Incorrect port configurations
- Missing or wrong labels/selectors
- Resource limits issues

## Deploy Your Fixes
```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

## Check Status
```bash
kubectl get pods
kubectl get svc
kubectl describe pod <pod-name>
```

**Expected Result:** 1 pod running successfully

**Tip:** If pods aren't starting, use `kubectl describe` and `kubectl logs` to investigate!
