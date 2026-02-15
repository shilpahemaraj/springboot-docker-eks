#!/bin/bash

# Script to build and run the Spring Boot Docker container

echo "=========================================="
echo "Building Spring Boot Docker Container"
echo "=========================================="

# Set the working directory
cd "$(dirname "$0")"

# Build the Docker image
echo "Building Docker image..."
docker build -t springboot-docker-eks:latest .

if [ $? -eq 0 ]; then
    echo "✓ Docker image built successfully!"

    # Stop and remove any existing container with the same name
    echo ""
    echo "Checking for existing containers..."
    if [ "$(docker ps -a -q -f name=springboot-app)" ]; then
        echo "Stopping and removing existing container..."
        docker stop springboot-app 2>/dev/null
        docker rm springboot-app 2>/dev/null
    fi

    # Run the container
    echo ""
    echo "Starting Docker container..."
    docker run -d -p 8080:8080 --name springboot-app springboot-docker-eks:latest

    if [ $? -eq 0 ]; then
        echo "✓ Container started successfully!"
        echo ""
        echo "=========================================="
        echo "Container Details:"
        echo "=========================================="
        docker ps -f name=springboot-app
        echo ""
        echo "Application URL: http://localhost:8080"
        echo ""
        echo "Useful commands:"
        echo "  - View logs: docker logs springboot-app"
        echo "  - Follow logs: docker logs -f springboot-app"
        echo "  - Stop container: docker stop springboot-app"
        echo "  - Remove container: docker rm springboot-app"
        echo ""
        echo "Waiting for application to start..."
        sleep 5
        echo ""
        echo "Checking logs:"
        docker logs springboot-app
    else
        echo "✗ Failed to start container"
        exit 1
    fi
else
    echo "✗ Docker build failed"
    exit 1
fi

