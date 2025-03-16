#!/bin/bash

# Set variables
PROJECT_ID=celi12
IMAGE_NAME=envoy-image
GCR_PATH=gcr.io/$PROJECT_ID/$IMAGE_NAME:latest
CLUSTER_NAME=cluster-1
ZONE=us-central1-a

# Authenticate with GCP
echo "Authenticating with GCP..."
gcloud auth configure-docker gcr.io

echo "Building Docker image..."
docker build -t $GCR_PATH ./envoy

echo "Pushing Docker image to GCR..."
docker push $GCR_PATH

echo "Getting GKE credentials..."
gcloud container clusters get-credentials $CLUSTER_NAME --zone $ZONE --project $PROJECT_ID

echo "Updating Envoy deployment with the new image..."
kubectl set image deployment/envoy-backend  envoy=$GCR_PATH

# Ensure pods restart to use the latest image
echo "Restarting Envoy deployment..."
kubectl rollout restart deployment/envoy-backend 
kubectl rollout status deployment/envoy-backend 

echo "Envoy deployment completed successfully."