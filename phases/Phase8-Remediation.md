# Phase 8 — Remediation

## 🎯 Objective

Eliminate SSH key sprawl and enforce secure, identity-based access using centralized authentication and access control mechanisms.

---

## 🛠️ What Was Done

- Removed duplicated and reused SSH keys from systems  
- Eliminated private key distribution across hosts  
- Transitioned from key-based trust to identity-based access  
- Prepared environment for centralized authentication (OS Login + IAM)

---

## 💻 Commands Used

### Remove duplicated keys from authorized_keys

nano ~/.ssh/authorized_keys

## Deleted duplicate or unnecessary entries

## Verify key removal
grep "lab-key" ~/.ssh/authorized_keys

## Remove private key from non-authorized systems
rm ~/.ssh/lab-key

## Verify SSH access is no longer possible using reused key
ssh -i ~/.ssh/lab-key -o IdentitiesOnly=yes ogom_obinor@10.10.10.X

Expected result: Access denied

## Result
- Removed all duplicated SSH key entries
- Eliminated shared key usage across systems
- Prevented SSH access using previously reused keys
- Reduced attack surface and access risk

## Security Insight

This phase demonstrates how removing unmanaged SSH keys significantly improves security posture.

### Key improvements:

- Access is no longer based on shared credentials
- Eliminates implicit trust relationships
- Reduces risk of lateral movement

Moves environment toward a Zero Trust model

## Key Takeaway

Removing unmanaged SSH keys is critical for securing cloud environments.

### This phase shows how eliminating poor key practices:

- Reduces attack surface
- Limits unauthorized access
- Improves system security

## Real-World Context

In enterprise environments, remediation is required to close security gaps identified during risk analysis.

Effective remediation includes removing insecure access methods and implementing stronger identity-based controls aligned with security frameworks.

## Conclusion

### The environment has been:

- Cleaned of insecure key configurations
- Hardened against unauthorized access
- Prepared for centralized identity-based authentication