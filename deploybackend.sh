#!/bin/bash

# Set variables
PROJECT_ID=celi12
IMAGE_NAME=backend-image
GCR_PATH=gcr.io/$PROJECT_ID/$IMAGE_NAME:latest
CLUSTER_NAME=sk
ZONE=us-west2-a

# Authenticate with GCP
echo "Authenticating with GCP..."
gcloud auth configure-docker gcr.io

echo "Building Docker image..."
docker build -t $GCR_PATH ./backend

echo "Pushing Docker image to GCR..."
docker push $GCR_PATH

echo "Getting GKE credentials..."
gcloud container clusters get-credentials $CLUSTER_NAME --zone $ZONE --project $PROJECT_ID

echo "Updating Backend deployment with the new image..."
kubectl set image deployment/backend-deployment backend-container=$GCR_PATH

# Ensure pods restart to use the latest image
echo "Restarting Backend deployment..."
kubectl rollout restart deployment/backend-deployment
kubectl rollout status deployment/backend-deployment

echo "Backend deployment completed successfully."
