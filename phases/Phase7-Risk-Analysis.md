# Phase 7 — Risk Analysis

## Objective

Analyze the security risks introduced by SSH key sprawl and trust relationships, and assess their impact on the overall environment.

---

## What Was Done

- Reviewed SSH key usage across all systems  
- Analyzed trust relationships between:
  - jump-host
  - app-server-1
  - db-server-1  
- Evaluated the impact of key reuse and duplication  
- Assessed potential attack paths and blast radius  

---

## Analysis Performed

### Access Path Mapping

- jump-host → app-server-1  
- app-server-1 → db-server-1  

This establishes a **multi-hop trust chain**

---

### Key Exposure Assessment

- Same SSH key used across multiple systems  
- Private key copied between hosts  
- Duplicate entries found in `authorized_keys`  

---

### Trust Model Evaluation

- Access is based on **key possession**, not identity  
- No centralized authentication or authorization  
- No enforcement of least privilege  

---

## Result

- Identified a **high-risk access model**  
- Confirmed that a single compromised key enables:
  - Full environment traversal  
  - Unauthorized access across systems  
- Determined lack of visibility and control over access  

---

## Security Insight

This environment demonstrates a **shared trust model**, where access is implicitly granted based on key reuse.

Key observations:

- No identity verification beyond SSH key  
- No segmentation between systems  
- No monitoring or audit controls  

This significantly increases the **attack surface and blast radius**

---

## Risk Assessment

| Risk | Severity | Impact |
|------|---------|--------|
| SSH key reuse | High | Unauthorized access across systems |
| Key duplication | High | Increased attack surface |
| Lack of identity control | High | No accountability or traceability |
| Lateral movement | Critical | Full environment compromise |
| No audit visibility | High | Undetected malicious activity |

---

## Key Takeaway

SSH key sprawl creates a **high-risk environment** where:

- Access is uncontrolled  
- Trust is implicit  
- Compromise spreads rapidly  

A single exposed key can lead to **complete infrastructure compromise**

---

## Real-World Context

In enterprise environments, risk analysis is essential for identifying compliance gaps and prioritizing remediation efforts.

Security controls must be evaluated to ensure they effectively reduce risk and align with frameworks such as NIST. :contentReference[oaicite:0]{index=0}

Without proper risk analysis, organizations cannot determine the severity of vulnerabilities or implement appropriate controls.

---

## Conclusion

The current access model is:

- Not secure  
- Not auditable  
- Not scalable  

Immediate remediation is required to enforce:
- Identity-based access control  
- Centralized authentication  
- Least privilege principles  