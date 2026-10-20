# AWS Cloud Governance: Prevention & Analysis Lifecycle - Core Security Best Practices & Account Hardening Guardrails

## 📌 Project Overview
This module documents the core foundational rules required to secure an enterprise AWS cloud architecture under the **AWS Shared Responsibility Model**. Securing a multi-tenant cloud workspace requires moving away from legacy account paradigms, isolating highly privileged administrative keys, enforcing strict identity multi-factor verification boundaries, and activating granular cost and API monitoring guardrails to prevent catastrophic account compromises.

---

## 🚀 Architectural Concepts & Account Governance Guardrails

### 1. The AWS Shared Responsibility Model Matrix
Deconstructed the clear line dividing security duties between the cloud provider and the tenant:
- **AWS Responsibility (Security OF the Cloud):** Amazon is responsible for protecting the global physical infrastructure that runs all of the services offered in the AWS Cloud. This includes physical data center security, hardware host nodes, network virtualization barriers, and facility utility management.
- **Customer Responsibility (Security IN the Cloud):** The tenant owns everything provisioned inside their perimeter. This includes configuring guest operating systems, maintaining patch compliance, managing network access controls (Security Groups/NACLs), encrypting data streams, and setting up identity access policies via AWS IAM.

### 2. The Isolation Paradigm of the Account Root User
- **The Definition:** The **AWS Account Root User** is the single initial identity created when the AWS account is first registered. It has absolute, un-restricitable access to all resources and financial billing data strings inside the account.
- **When to Use the Root User:** The root account should be treated as an emergency vault key and utilized *strictly* for tasks that explicitly require root administrative credentials:
  - Changing account settings (such as the account name, root password, or root email address).
  - Modifying or closing the AWS Account entirely.
  - Changing your AWS Support plan parameters.
  - Viewing specific tax invoice documents or structural billing data parameters.

---

## 🛠️ The 4 Core Foundational Security Best Practices

### 1️⃣ Stop Using the AWS Account Root User for Everyday Operations
- **The Action:** Create the root account, provision a dedicated **AWS IAM User** with explicit administrative clearances (`AdministratorAccess`), and store the root account login details in a secure physical safe. 
- **The Reason:** Because root user credentials cannot be restricted by IAM policies, using them for daily engineering deployments exposes the organization to massive risk. If root keys leak, attackers gain complete control over the entire cloud architecture.

### 2️⃣ Enforce Multi-Factor Authentication (MFA) Globally
- **The Action:** Bind an independent physical or virtual **Multi-Factor Authentication (MFA)** device tracker to the root user identity and *all* administrative IAM user accounts.
- **The Reason:** It adds a vital protective layer by requiring a dynamic, short-term session token alongside standard passwords. This stops brute-force credential stuffing or phishing attacks from accessing the environment.

### 3️⃣ Activate Account-Wide AWS CloudTrail
- **The Action:** Turn on a global, multi-region **AWS CloudTrail** log stream to continuously capture every inbound API modification request, management console click, and programmatic command line action.
- **The Reason:** It creates a tamper-evident audit ledger that records exactly who did what, when, and from where. This is crucial for forensic analysis, security tracking, and passing regular compliance audits.

### 4️⃣ Activate Billing Alerts & Cost Management Reports
- **The Action:** Enable **AWS Billing Reports** and set up automated **AWS Budgets Cost Alarms** via Amazon CloudWatch.
- **The Reason:** Acts as an early threat detection system. If an attacker gains access to your account and attempts to spin up massive rows of hidden crypto-mining nodes or heavy compute infrastructure, the cost alarm will trigger an immediate alert before an organization faces a catastrophic, unexpected bill.

---

## 📊 Solution Architecture Blueprint: Hardened Account Access Control

```text
           [ Administrative Access Attempt ]
                           │
                           ▼
              ┌─────────────────────────┐
              │ 1. IAM User Credentials │ ──> Reject Root User Logins
              └────────────┬────────────┘
                           │
                           ▼
              ┌─────────────────────────┐
              │ 2.MFA Session Validation│ ──> Mandate Short-Term Dynamic Token Check
              └────────────┬────────────┘
                           │
                           ▼
          [ API Request Checked & Allowed ]
                           │
             ┌─────────────┴─────────────┐
             ▼                           ▼
┌─────────────────────────┐ ┌─────────────────────────┐
│ 3. AWS CloudTrail Audit │ │ 4. Billing CloudWatch   │
│ (Logs API Actions)      │ │   (Tracks Cost Drifts)  │
└─────────────────────────┘ └─────────────────────────┘
```
