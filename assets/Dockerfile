# BROKEN DOCKERFILE - Candidate must fix this!

# Issue 1: Wrong base image version
FROM openjdk:8-jdk-alpine

# Issue 2: Wrong working directory
WORKDIR /app

# Issue 3: Missing application JAR file copy
# The JAR is in the current directory as app.jar

# Issue 4: Wrong port exposed
EXPOSE 8081

# Issue 5: Incorrect Java command (missing -jar flag)
CMD ["java", "app.jar"]

# Additional issues to find:
# - No optimization (should use multi-stage or slim image)
# - No proper signal handling
# - Hard-coded memory settings not ideal for containers
