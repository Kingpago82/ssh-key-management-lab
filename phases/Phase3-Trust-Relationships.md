# Phase 3 — Trust Relationships

## Objective

Establish SSH trust between systems by sharing public keys, enabling one server (jump-host) to securely access another (app-server-1) without a password.

---

## What Was Done

- Generated an SSH key pair on the **jump-host**
- Copied the **public key** to **app-server-1**
- Added the public key to `~/.ssh/authorized_keys`
- Verified SSH access from jump-host → app-server-1 using the private key

---

## Commands Used

### Generate SSH key pair (on jump-host)

ssh-keygen -t rsa -b 2048 -f ~/.ssh/lab-key -C "lab-key"

## View public key

cat ~/.ssh/lab-key.pub

## Add public key to app-server-1

echo "ssh-rsa AAAA... lab-key" >> ~/.ssh/authorized_keys

- Replace with the actual output of lab-key.pub

## Set proper permissions

ssh -i ~/.ssh/lab-key -o IdentitiesOnly=yes ogom_obinor@10.10.10.3

## Result

- Successfully established passwordless SSH access
- Jump-host can securely connect to app-server-1 using the private key
- Verified remote access without interactive authentication

## Security Insight

SSH trust relationships allow seamless system-to-system access by trusting a shared key.

However:

- Access is tied to key possession, not user identity
- Trust is implicit and persistent once configured
- There is no centralized visibility of where keys are used

This introduces the foundation for key reuse and lateral movement

## Risk Consideration
- If the private key is compromised, all trusted systems are exposed
- No centralized access control or auditing
- Difficult to track where access has been granted
- Violates Zero Trust principles (implicit trust)

## Key Takeaway

SSH trust relationships simplify access, but introduce hidden risks.

This phase demonstrates how convenience can evolve into security exposure, setting the stage for key sprawl and lateral movement in later phases.















