# Step 4: Configure, Scale, and Expose

## Task 1: Add ConfigMap
Create a ConfigMap for application configuration.

```bash
# Create a ConfigMap with these properties
# app.name=MyJavaApp
# app.version=1.0
# log.level=INFO
```

Update the deployment to use this ConfigMap as environment variables.

## Task 2: Add Health Checks
Add proper liveness and readiness probes to your deployment:
- Liveness probe: `GET /health` on port 8080
- Readiness probe: `GET /ready` on port 8080
- Initial delay: 30 seconds
- Period: 10 seconds

## Task 3: Set Resource Limits
Add resource requests and limits:
- Memory request: 256Mi
- Memory limit: 512Mi
- CPU request: 250m
- CPU limit: 500m

## Task 4: Scale the Application
```bash
# Scale to 3 replicas
kubectl scale deployment java-app --replicas=3

# Verify all 3 pods are running
kubectl get pods
```

## Task 5: Expose the Service
Create or update the service to expose the application:
- Service type: NodePort
- Port: 8080
- NodePort: 30080

## Test the Deployment
```bash
# Get service details
kubectl get svc java-app

# Test the endpoint
curl http://localhost:30080/health

# Check all pods are serving traffic
kubectl get endpoints java-app
```

## Verification Commands
```bash
kubectl get configmap
kubectl describe deployment java-app
kubectl get pods -o wide
kubectl get svc java-app
```

## Success Criteria
- ✅ ConfigMap created and mounted
- ✅ Health probes configured
- ✅ Resource limits set
- ✅ 3 replicas running
- ✅ Service accessible on NodePort
- ✅ All pods receiving traffic

**Bonus:** Perform a rolling update by changing the ConfigMap and observe zero downtime!
