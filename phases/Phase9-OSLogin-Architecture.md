# Phase 9 — OS Login Architecture

## Objective

Implement centralized, identity-based access control using Google Cloud OS Login and IAM, eliminating the need for SSH key distribution and enforcing Zero Trust principles.

---

## What Was Done

- Enabled OS Login at the project level  
- Removed project-wide SSH keys from metadata  
- Transitioned authentication from SSH keys to IAM-based identity  
- Verified access using Google Cloud identity instead of local keys  

---

## Commands Used

### Enable OS Login (project level)

gcloud compute project-info add-metadata \
  --metadata enable-oslogin=TRUE

## Verify OS Login is enabled
gcloud compute project-info describe \
  --format="table(commonInstanceMetadata.items.key, commonInstanceMetadata.items.value)"

## Remove SSH keys from project metadata

gcloud compute project-info remove-metadata \
  --keys=ssh-keys

## Verify IAM identity
gcloud config get-value account

## Connect using OS Login
gcloud compute ssh app-server-1 --zone=us-central1-a

## Result
- Successfully authenticated using IAM identity
- SSH access no longer dependent on local key files
- New user identity format observed (e.g., user_email_com)
- Verified access across systems without SSH key reuse

## Security Insight

OS Login replaces SSH key-based access with identity-based authentication.

### Key improvements:

- Access tied to Google Cloud identity (IAM)
- No private key distribution across systems
- Centralized access control and auditing

### This enforces Zero Trust Architecture where:

- Identity is verified for every access
- No implicit trust exists between systems

## Risk Reduction

## Before	
- Shared SSH keys
- Key sprawl
- Implicit trust
- No audit visibility
- Lateral movement possible


## After
- Identity-based access (IAM)
- No key distribution
- Explicit authentication
- Full audit logging
- Strongly restricted

## Key Takeaway

Centralized identity management is critical for securing cloud environments.

### OS Login + IAM provides:

- Strong authentication
- Centralized control
- Auditability
- Reduced attack surface

## Real-World Context

In enterprise environments, identity-based access control is a foundational security control aligned with:

- Zero Trust Architecture
- Least Privilege
- NIST access control frameworks

Organizations replace unmanaged SSH keys with identity-driven access to improve security posture and compliance.

## Conclusion

The environment has been fully transformed:

- SSH key sprawl eliminated
- Identity-based access enforced
- Centralized authentication implemented
- Zero Trust principles applied

The system is now secure, scalable, and audit-ready