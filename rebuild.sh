#!/bin/bash

ZONE="us-central1-a"

echo "Creating jump-host..."
gcloud compute instances create jump-host \
  --zone=$ZONE \
  --machine-type=e2-micro

echo "Creating app-server-1..."
gcloud compute instances create app-server-1 \
  --zone=$ZONE \
  --machine-type=e2-micro

echo "Creating db-server-1..."
gcloud compute instances create db-server-1 \
  --zone=$ZONE \
  --machine-type=e2-micro

echo "Done."