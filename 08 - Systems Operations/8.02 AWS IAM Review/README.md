# AWS Cloud Governance: AWS IAM Review - Access Control Vectors, Enterprise Policy Hierarchies & Identity Hardening Guardrails

## 📌 Section Overview
This module documents the practical implementation, security credentials, policy evaluation logic, and baseline best practices that govern AWS Identity and Access Management (IAM) within cloud operations. Maintaining a secure multi-tenant cloud fleet requires configuring discrete authentication vectors, mapping robust identity and resource authorization perimeters, and enforcing structural Service Control Policies (SCPs) to establish ironclad access boundaries across corporate cloud environments.

---

## 🚀 Authentication Vectors & Security Credentials

### 1. Cloud Infrastructure Access Modes
AWS authenticates incoming resource requests through two separate interaction planes:
- **AWS Management Console Access:** A graphical user interface (GUI) designed for human administrators. Access is protected by user identity strings, explicit passwords, and mandatory Multi-Factor Authentication (MFA) tokens.
- **Programmatic API Access:** Engineered for remote compute servers, automated scripts, third-party software tools, and deployment pipelines. Programmatic requests bypass the browser layer entirely, communicating directly with AWS endpoint wrappers using secure code signatures.

### 2. Deconstructing Security Credential Types
- **Passwords:** Human-readable text strings combined with usernames to log into the browser console workspace.
- **Access Keys (Access Key ID & Secret Access Key):** Cryptographic token pairs utilized to sign programmatic API requests over the AWS Command Line Interface (CLI) or software development kits (SDKs).
- **IAM Roles & Temporary Tokens:** The absolute standard for resource-to-resource security. Instead of hardcoding persistent keys, computing resources (such as an EC2 instance or AWS Lambda function) are assigned an IAM Role to automatically fetch short-lived, self-rotating credentials via the AWS Security Token Service (STS).
- **Key Pairs (`.pem` / `.ppk`):** Asymmetric cryptographic certificates used specifically to authenticate secure remote shell (SSH) client links into compute instance operating system kernels.

---

## 🛡️ Policy Evaluation Logic & Authorization Topologies

Authorization dictates what an authenticated identity is explicitly permitted to execute. AWS evaluates permissions through four distinct layer frameworks:

### 1. Identity-Based Policies
- **The Mechanic:** JSON schema sheets attached directly to IAM users, groups, or roles. They map out explicit parameter arrays defining exactly which actions can be executed over specified target resources.
- **Managed vs. Inline:** Utilizing AWS-Managed global templates for standard roles alongside custom Inline policies tailored strictly to unique enterprise application parameters.

### 2. Resource-Based Policies
- **The Mechanic:** Inline JSON policies attached *directly onto the target storage or computing resource itself* (such as an Amazon S3 storage bucket, an Amazon SQS queue, or an AWS KMS encryption key), rather than the user.
- **Cross-Account Trust:** They explicitly define which external principals or outside AWS accounts are granted entry to look into or inject data directly into that specific resource asset.

### 3. AWS Organizations Service Control Policies (SCPs)
- **The Mechanic:** Max-level governance guardrails deployed at the master account tier inside a multi-account organization layout.
- **The Perimeter Rule:** SCPs establish absolute maximum permission ceilings for every member account inside an Organizational Unit (OU). Even if an IAM user inside a child account has full `AdministratorAccess` permissions, an SCP `Deny` statement instantly overrides local setups, blocking prohibited actions globally across the account.

### 4. Access Control Lists (ACLs)
- **The Mechanic:** A legacy, lower-level security matrix attached to legacy resource structures (such as individual S3 objects). ACLs provide a basic tracking checklist indicating which external accounts or public groups are granted read/write permissions. *(Note: Modern architecture design strongly prioritizes migrating entirely to IAM and resource-based policies for more granular control).*

---

## 📊 Enterprise Industry Best Practices (The SysOps Blueprint)

To safeguard corporate systems against data corruption or credential leaks, operations teams must strictly apply these baseline guardrails:

*   **Enforce the Principle of Least Privilege (PoLP):** Grant identities *strictly* the minimum technical permissions necessary to execute their assigned operational task, and absolutely nothing more.
*   **Lock Down the AWS Root User Account:** Permanently delete the root account’s API access keys, enable strict Multi-Factor Authentication (MFA), use it only for critical billing tasks, and conduct all daily administration operations inside isolated IAM User profiles.
*   **Leverage Groups for Policy Scaling:** Avoid attaching loose JSON policies directly onto individual user nodes. Group users into logical operational cohorts (e.g., `SysOps-Team`, `Dev-Squad`) and map permission sets to the group parent frame.
*   **Configure Strict Password & Rotation Complexities:** Require complex, high-entropy password characters and enforce automated access key rotation intervals to neutralize stale token vulnerabilities.
*   **Prefer Roles over Long-Term Access Keys:** Never store plaintext access keys inside application configuration scripts or local hard drives. Mandate IAM Roles to pass temporary credentials to cloud compute assets natively.

---

## 📐 Solution Architecture Blueprint: The AWS Authorization Evaluation Flow

```text
    [ Incoming API Request ] ──> Is request from Root Account? ──(Yes)──> [ ALLOW ACCESS ]
               │
              (No)
               ▼
   [ Check Organization SCPs ] ───(Explicit Deny Match?) ────────(Yes)──> [ DENY ACCESS ]
               │
              (No)
               ▼
   [ Check Identity-Based Policies ] ──(Explicit Allow Match?) ──(No)───> [ DENY ACCESS ]
               │
              (Yes)
               ▼
    [ Final Evaluation Check ] ───(Any remaining Deny rules?) ──(Yes)──> [ DENY ACCESS ]
               │
              (No)
               ▼
        [ ALLOW ACCESS ]
```
