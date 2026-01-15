# Step 3: Troubleshooting Challenge

## Scenario
After deployment, you notice the pod keeps crashing. Use your troubleshooting skills to diagnose and fix the issue.

## Investigate the Problem
```bash
kubectl get pods
kubectl logs <pod-name>
kubectl describe pod <pod-name>
kubectl get events --sort-by=.metadata.creationTimestamp
```

## Common Issues You Might Find
- **CrashLoopBackOff**: Application exits immediately
- **OOMKilled**: Out of memory
- **ImagePullBackOff**: Can't pull the image
- **RunContainerError**: Container configuration issue

## Your Tasks
1. Identify why the pod is failing
2. Determine if it's a Docker issue or K8s configuration issue
3. Fix the root cause
4. Verify the pod runs successfully

## Debug Tips
```bash
# Check pod logs
kubectl logs <pod-name> --previous

# Execute into a running container (if it stays up)
kubectl exec -it <pod-name> -- /bin/sh

# Check resource usage
kubectl top pods

# See detailed pod info
kubectl get pod <pod-name> -o yaml
```

## Success Criteria
- Pod status: `Running`
- Pod ready: `1/1`
- No restart loops
- Application responds to health checks

**Challenge Question:** Explain what caused the issue and how you fixed it.
