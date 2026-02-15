#!/bin/bash

# Script to stop and clean up the Docker container

echo "Stopping Spring Boot Docker container..."
docker stop springboot-app

echo "Removing Spring Boot Docker container..."
docker rm springboot-app

echo "✓ Container stopped and removed"
echo ""
echo "To remove the Docker image, run:"
echo "  docker rmi springboot-docker-eks:latest"

