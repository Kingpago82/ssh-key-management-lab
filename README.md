# SSH Key Management Lab

## Overview

This lab demonstrates how to securely manage SSH keys for accessing virtual machines in a cloud environment. It focuses on identity-based access control, secure authentication, and key lifecycle management.

---

## Objectives

- Generate SSH key pairs securely 
- Configure SSH access to virtual machines 
- Enforce least-privilege access 
- Understand risks of improper key management 
- Apply secure key rotation practices 

---

## Architecture

### BEFORE: Insecure Architecture

![Before](architecture/architecture-before.png)

- Password-based authentication 
- Shared credentials across users 
- No key rotation or audit tracking 
- High risk of unauthorized access 

---

### AFTER: Secure Architecture

![After](architecture/architecture-after.png)

- SSH key-based authentication 
- Unique keys per user 
- IAM-based access control 
- OS Login enabled 
- Centralized and auditable access 

---

## Technologies Used

- Google Cloud Platform (GCP) 
- Compute Engine (VM Instances) 
- Cloud Shell 
- SSH (OpenSSH) 
- IAM (Identity and Access Management) 

---

## Lab Setup

### 1. Create VM

- Navigate to **Compute Engine → VM Instances** 
- Create a Linux VM 
- Enable SSH access 

---

### 2. Generate SSH Keys

```bash
ssh-keygen -t rsa -b 4096 -C your-email@example.com

### SSH Key Generation Output

This creates:

- Private key → `~/.ssh/id_rsa`  
- Public key → `~/.ssh/id_rsa.pub`  

---

### 3. Add Public Key to VM

```bash
cat ~/.ssh/id_rsa.pub

- Copy the output
- Add it to:
- VM metadata
- OR OS Login

### 4.Connect via SSH

ssh username@EXTERNAL_IP

### Security Best Practices
- Never share private keys
- Use passphrases for SSH keys
- Rotate keys regularly
- Remove unused keys immediately
- Use IAM roles instead of manual key distribution
- Store secrets securely (e.g., Secret Manager)

In production systems, credentials should not be stored in plaintext. Use secure storage solutions.

### Key Concepts
Identity & Access Control

SSH keys replace passwords, reducing brute-force attack risks.

### Workload Security

Cloud workloads must be secured using proper controls aligned with frameworks like NIST.

- Workloads are composed of services supporting business needs
- Controls such as access restrictions and encryption enforce security posture

### Common Misconfigurations
- Storing private keys in public repositories
- Using the same key across multiple users
- Not restricting IP access
- Lack of audit logging

### Real-World Relevance

This lab aligns with roles such as:

- Cloud Security Engineer
- DevOps Engineer
- Site Reliability Engineer

### Key Skills Demonstrated
- Secure access management
- Infrastructure security
- Compliance alignment (NIST, IAM policies)

### Learning Outcomes
- Understand SSH-based authentication
- Implement secure access to cloud resources
- Apply security controls to cloud workloads
- Reduce attack surface in cloud environments
