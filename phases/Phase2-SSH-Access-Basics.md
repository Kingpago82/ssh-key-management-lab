# Phase 2 — SSH Access Basics

## Objective

Establish secure SSH access to cloud virtual machines and understand how key-based authentication works in a basic environment.

---

## What Was Done

- Connected to the **jump-host** using Google Cloud CLI
- Verified system identity and user context
- Observed default SSH access behavior in GCP
- Confirmed that SSH access was functioning correctly before introducing custom keys

---

## Commands Used

### Connect to jump-host from Cloud Shell

gcloud compute ssh jump-host --zone=$ZONE

## Verify system identity

hostname
whoami

---

## Result
- Successfully established SSH session to the jump-host
- Verified active user and host identity
- Confirmed that SSH connectivity is operational using default GCP-managed access

---

## Security Insight

At this stage, SSH access is functional but relies on default access configurations.

Key observations:

- Access is allowed without strict identity enforcement
- No centralized control over who can access systems
- No visibility into how credentials are managed across machines

While convenient, this setup can become risky as environments scale.

---

## Risk Consideration
- Default SSH access may not enforce least privilege
- Credentials are not centrally managed
- Access is not easily auditable
- Potential for inconsistent security across systems

---

## Key Takeaway

SSH provides secure remote access, but without proper identity and access controls, it can introduce security risks.

This phase establishes the baseline access model, which will later be expanded to demonstrate key sprawl and lateral movement risks.