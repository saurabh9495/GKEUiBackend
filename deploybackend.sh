#!/bin/bash

# Set variables
PROJECT_ID=celi12
IMAGE_NAME=backend-image
GCR_PATH=gcr.io/$PROJECT_ID/$IMAGE_NAME:latest
CLUSTER_NAME=cluster-1
ZONE=us-central1-c

# Authenticate with GCP
echo "Authenticating with GCP..."
gcloud auth configure-docker

echo "Building Docker image..."
docker build -t $GCR_PATH ./backend

echo "Pushing Docker image to GCR..."
docker push $GCR_PATH

echo "Getting GKE credentials..."
gcloud container clusters get-credentials $CLUSTER_NAME --zone $ZONE --project $PROJECT_ID

echo "Restarting Backend deployment..."
kubectl set image deployment/backend-deployment backend-container=$GCR_PATH

echo "Deployment completed successfully."
