# Phase 6 — Discovery

## 🎯 Objective

Identify and analyze SSH key usage across systems to understand the scope of key sprawl and potential security exposure.

---

## 🛠️ What Was Done

- Inspected `authorized_keys` files on multiple systems  
- Identified reused SSH keys across jump-host, app-server-1, and db-server-1  
- Verified duplicate key entries and trust relationships  
- Reviewed SSH configurations and access paths  

---

## 💻 Commands Used

### View authorized keys

cat ~/.ssh/authorized_keys

## Count duplicate key entries

grep -c "lab-key" ~/.ssh/authorized_keys

## Identify key presence across systems

grep "lab-key" ~/.ssh/authorized_keys

## Verify access paths

hostname
whoami

## Result
- Confirmed that the same SSH key is present across multiple systems
- Identified duplicate entries in authorized_keys
- Verified that trust relationships allow cross-system access
- Mapped the access path between systems

## Security Insight

This phase demonstrates how lack of visibility into SSH key usage creates blind spots in security.

### Key observations:

- No centralized inventory of SSH keys
- No tracking of where keys are deployed
- No visibility into access paths or trust relationships

Without discovery, organizations cannot assess or control access risk

## Risk Consideration
- Undetected key reuse across multiple systems
- Hidden trust relationships enabling lateral movement
- No auditing or monitoring of SSH key usage
- Increased attack surface due to unmanaged keys

## Key Takeaway

Discovery is a critical step in cloud security.

### Organizations must be able to identify:

- Where SSH keys exist
- How they are used
- Which systems trust them

### This phase highlights the need for:

- Key inventory management
- Access visibility
- Continuous monitoring

## Real-World Context

In enterprise environments, discovery aligns with security and compliance practices.

Workloads are composed of interconnected services, and securing them requires visibility into access controls and authentication mechanisms.

Without proper discovery, security teams cannot effectively map controls or identify gaps.
























