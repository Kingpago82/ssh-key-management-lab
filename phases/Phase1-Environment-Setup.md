# Phase 1 — Environment Setup

## Objective
Create a GCP environment with:
- VPC
- Subnet
- jump-host
- app-server-1
- db-server-1

## Commands

```bash
gcloud compute instances create jump-host ...
gcloud compute instances create app-server-1 ...
gcloud compute instances create db-server-1 ...