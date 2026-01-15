# Step 1: Fix the Broken Dockerfile

## Task
The Dockerfile in `/root/app/Dockerfile` has several issues that prevent it from building. Your job is to:

1. Review the Dockerfile
2. Identify the problems
3. Fix them
4. Build the Docker image successfully
5. Test it locally

## Examine the Files
```bash
cd /root/app
cat Dockerfile
ls -la
```

## Your Goals
- Fix all syntax and logical errors
- Optimize the build (use multi-stage if possible)
- Ensure the Java app runs correctly
- Tag the image as `java-app:1.0`

## Test Your Fix
```bash
docker build -t java-app:1.0 .
docker run -p 8080:8080 java-app:1.0
```

## Verification
Once running, test the endpoint:
```bash
curl http://localhost:8080/health
```

You should see: `{"status":"UP"}`

**Tip:** Check the error messages carefully. Docker tells you exactly what's wrong!
