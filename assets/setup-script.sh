#!/bin/bash

# This script sets up the environment for the assessment
# Killercoda runs this before the scenario starts

echo "Setting up Kubernetes interview environment..."

# Create app directory
mkdir -p /root/app
mkdir -p /root/k8s

# Copy broken files to working directories
cp /tmp/Dockerfile /root/app/
cp /tmp/deployment.yaml /root/k8s/
cp /tmp/service.yaml /root/k8s/

# Create a simple Spring Boot JAR simulator
cat > /root/app/app.jar << 'EOF'
# Mock JAR file - in real scenario, use actual Spring Boot app
EOF

# Create a simple Java app that can be tested
cat > /root/app/SimpleApp.java << 'EOF'
import com.sun.net.httpserver.HttpServer;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpExchange;
import java.io.OutputStream;
import java.io.IOException;
import java.net.InetSocketAddress;

public class SimpleApp {
    public static void main(String[] args) throws Exception {
        HttpServer server = HttpServer.create(new InetSocketAddress(8080), 0);
        
        server.createContext("/health", new HttpHandler() {
            public void handle(HttpExchange exchange) throws IOException {
                String response = "{\"status\":\"UP\"}";
                exchange.sendResponseHeaders(200, response.length());
                OutputStream os = exchange.getResponseBody();
                os.write(response.getBytes());
                os.close();
            }
        });
        
        server.createContext("/ready", new HttpHandler() {
            public void handle(HttpExchange exchange) throws IOException {
                String response = "{\"ready\":true}";
                exchange.sendResponseHeaders(200, response.length());
                OutputStream os = exchange.getResponseBody();
                os.write(response.getBytes());
                os.close();
            }
        });
        
        server.setExecutor(null);
        server.start();
        System.out.println("Server started on port 8080");
    }
}
EOF

# Compile the Java app (if JDK available)
# javac /root/app/SimpleApp.java
# jar cfe /root/app/app.jar SimpleApp SimpleApp.class

echo "Environment setup complete!"
echo ""
echo "Files available:"
echo "  /root/app/Dockerfile (BROKEN - needs fixing)"
echo "  /root/app/app.jar (Java application)"
echo "  /root/k8s/deployment.yaml (BROKEN - needs fixing)"
echo "  /root/k8s/service.yaml (BROKEN - needs fixing)"
echo ""
echo "Start with: cd /root/app && cat Dockerfile"
