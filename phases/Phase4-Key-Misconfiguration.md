# Phase 4 — Key Misconfiguration

## Objective

Demonstrate how improper SSH key management—such as duplication and reuse—introduces security vulnerabilities across multiple systems.

---

## What Was Done

- Reused the same SSH private key (`lab-key`) across multiple systems  
- Copied the same public key into multiple `authorized_keys` files  
- Allowed the same key to grant access to more than one server  
- Verified that a single key could access multiple machines  

---

## Commands Used

### Verify existing authorized keys (on app-server-1)

cat ~/.ssh/authorized_keys

## Add duplicate key entry (simulating misconfiguration)

echo "ssh-rsa AAAA... lab-key" >> ~/.ssh/authorized_keys

## Verify duplication

grep -c "lab-key" ~/.ssh/authorized_keys

## View duplicated entries

grep "lab-key" ~/.ssh/authorized_keys

## Test SSH access to another system (if configured)

## Result
- Same SSH key successfully used across multiple systems
- Duplicate entries found in authorized_keys
- Confirmed that one key can provide access to multiple machines

## Security Insight
- Same SSH key successfully used across multiple systems
- Duplicate entries found in authorized_keys
- Confirmed that one key can provide access to multiple machines

## Security Insight
This phase demonstrates SSH key reuse, one of the most common real-world misconfigurations.

Key observations:
- A single key now controls access to multiple systems
- There is no distinction between users or systems
- Access cannot be easily tracked or restricted

This creates a shared trust model, which is inherently insecure

## Risk Consideration
- If one key is compromised, all connected systems are compromised
- Duplicate entries increase attack surface
- No centralized identity or access control
- Violates Principle of Least Privilege
- Enables lateral movement across infrastructure

## Key Takeaway
Reusing SSH keys across systems introduces significant security risk.

This phase highlights how small misconfigurations can lead to large-scale exposure, forming the foundation for key sprawl and lateral movement attacks.