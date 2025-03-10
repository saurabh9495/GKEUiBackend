#!/bin/bash

# Set variables
PROJECT_ID=celi12
IMAGE_NAME=ui-image
GCR_PATH=gcr.io/$PROJECT_ID/$IMAGE_NAME:latest
CLUSTER_NAME=cluster-1
ZONE=us-central1-c

# Authenticate with GCP
echo "Authenticating with GCP..."
gcloud auth configure-docker

echo "Building Docker image..."
docker build -t $GCR_PATH ./ui

echo "Pushing Docker image to GCR..."
docker push $GCR_PATH

echo "Getting GKE credentials..."
gcloud container clusters get-credentials $CLUSTER_NAME --zone $ZONE --project $PROJECT_ID

echo "Restarting UI deployment..."
kubectl set image deployment/ui-deployment ui-container=$GCR_PATH

echo "Deployment completed successfully."
