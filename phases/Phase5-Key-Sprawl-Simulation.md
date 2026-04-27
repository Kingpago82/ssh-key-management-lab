# Phase 5 — Key Sprawl Simulation

## 🎯 Objective

Simulate SSH key sprawl and demonstrate how a single compromised key enables lateral movement across multiple systems.

---

## 🛠️ What Was Done

- Reused the same SSH key (`lab-key`) across:
  - jump-host
  - app-server-1
  - db-server-1
- Established trust relationships between systems
- Copied the private key to additional systems (simulating poor security practices)
- Used one key to access multiple servers sequentially

---

## 💻 Commands Used

### Copy private key to another system (simulated insecure practice)

nano ~/.ssh/lab-key
chmod 600 ~/.ssh/lab-key

## SSH from jump-host → app-server-1
ssh -i ~/.ssh/lab-key -o IdentitiesOnly=yes ogom_obinor@10.10.10.3

## SSH from app-server-1 → db-server-1
ssh -i ~/.ssh/lab-key -o IdentitiesOnly=yes ogom_obinor@10.10.10.4

## Verify system access

hostname
whoami

##  Result
Successfully accessed multiple systems using a single SSH key

- Demonstrated chain access:
- jump-host → app-server-1 → db-server-1
- Confirmed that one key enables full environment traversal

## Security Insight

This phase demonstrates SSH key sprawl, where a single key is:

- Reused across multiple systems
- Copied between hosts
- Trusted without restriction

## Key observations:

- No identity validation beyond key possession
- No centralized access control
- No visibility into key usage

This creates a high-risk environment where one compromised key = full access

## Risk Consideration
- Complete environment compromise from a single key
- Enables lateral movement across infrastructure
- No auditing or accountability

### Violates:
- Zero Trust principles
- Least Privilege
- Difficult to detect or contain breaches

## Key Takeaway

SSH key sprawl is a critical security risk in cloud environments.

This phase demonstrates how poor key management can allow an attacker to move freely across systems once initial access is gained.

## It highlights the need for:

- Identity-based access control
- Centralized authentication
- Elimination of shared keys