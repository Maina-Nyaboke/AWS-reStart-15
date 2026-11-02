# AWS Cloud Engineering: Network Security & Triage - Stateful Security Groups, Stateless Network ACLs, Bastion Perimeters & Forensic Network Troubleshooting Lifecycles

## 📌 Section Overview
This module documents the practical security enforcement frameworks, multi-tier firewall configurations, and forensic debugging workflows required to **Secure and Troubleshoot Virtual Private Cloud (VPC) Infrastructure** at an enterprise scale [1.1]. To enforce true Defense-in-Depth network integrity, we examine the structural differences between stateful and stateless traffic filters, analyze the operational mechanics of perimeter Bastion hosts, and establish a systematic root-cause analysis (RCA) methodology to diagnose and remediate broken instance connections, SSH failures, NAT drops, and peering routing blocks [1.1].

---

## 🛡️ The Architecture of Layered Network Defense

AWS network security enforces a **Defense-in-Depth** topology by chaining separate firewall tracking layers together to protect computing resources [1.1]:

### 1. Security Groups (The Stateful Instance-Level Shield)
- **The Boundary:** Operates strictly at the individual **Elastic Network Interface (ENI) / Instance layer**, acting as a dedicated fire-shield directly wrapping your virtual machine.
- **Stateful Mechanics:** If an inbound connection request is explicitly evaluated and permitted to pass through an inbound rule, the Security Group **automatically allows the outbound response traffic to flow back out** to the client, completely ignoring any outbound restriction blocks. 
- **Default Baseline State:** A newly provisioned Security Group contains zero inbound rules (drops 100% of incoming data packets by default) and contains a wildcard outbound rule allowing all traffic out. It supports *Allow* rules exclusively—explicit *Deny* rules are impossible to write.

### 2. Network Access Control Lists / NACLs (The Stateless Subnet-Level Perimeter)
- **The Boundary:** Operates at the **Subnet Boundary Layer**. Every packet moving into or out of a network subnet zone must pass through this evaluation gatekeeper.
- **Stateless Mechanics:** The firewall holds zero connection memory state tracking. If you write an inbound rule permitting traffic to cross the perimeter, **you must write a separate, explicit outbound rule to allow the return data packets back out**; otherwise, the connection hits a wall and drops.
- **Rule Order Processing:** Evaluates rules sequentially from lowest to highest rule integer number (e.g., Rule 100 is processed before Rule 200). The moment a packet satisfies a rule criteria string, processing halts immediately. It supports both explicit *Allow* and explicit *Deny* rule definitions.
- **Default Baseline State:** Default VPC NACLs allow 100% of inbound and outbound traffic. Custom-built NACLs deny 100% of all traffic until explicit rules are attached.

### 3. Perimeter Jump Boxes: Bastion Hosts
- **The Design Pattern:** Private subnets containing mission-critical database assets hold zero public internet access paths to block external threats [1.1]. To troubleshoot these resources safely, architects launch a single, heavily hardened public-facing instance known as a **Bastion Host (Jump Box)** inside a public subnet.
- **The Access Path:** Administrators SSH securely into the Bastion Host first, and use it as a proxy launchpad to safely jump across internal private IP network lines to communicate with private instances, keeping the core fleet secure.

---

## 🛠️ The Forensic Network Troubleshooting Playbook (RCA Index)

When enterprise cloud operations break, engineers bypass guesswork by applying deterministic troubleshooting checks [1.1]:

### 1. Troubleshooting Instance & Web Connection Failures
- **The Symptom:** Browsers hit an immediate `ERR_CONNECTION_TIMED_OUT` wall attempting to load a web page.
- **The Forensic Triage:** 
  1. *Check Public Routing:* Verify if the instance resides in a subnet carrying an active route table path to an Internet Gateway (`0.0.0.0/0 -> igw-xxxx`) [1.1].
  2. *Audit Stateful Rules:* Check if the instance’s Security Group has an explicit inbound rule for **HTTP (Port 80)** or **HTTPS (Port 443)**.
  3. *Audit Stateless Rules:* Check the subnet NACL table rules. Ensure that the **Ephemeral Port Range (TCP 1024-65535)** is wide open on the outbound layer to permit return packets to clear the subnet boundary.

### 2. Troubleshooting Broken SSH Handshakes
- **The Symptom:** Terminal connections return an immediate `Permission denied (publickey)` or connection timeout error block.
- **The Forensic Triage:**
  1. *Verify Key Matching:* Ensure the private key file token (`.pem` / `.ppk`) matches the public key embedded inside the instance's `.ssh/authorized_keys` local path exactly.
  2. *Check File System Permissions:* Local Linux security requires tight access boundaries. Run `chmod 400 key.pem` to freeze permissions; if the key file is too publicly readable, the SSH client binary drops the handshake automatically.
  3. *Verify Source Firewall Ingress:* Ensure the Security Group restricts Port 22 entry strictly to your trusted administrative public IP address block, preventing brute-force drops.

### 3. Troubleshooting NAT Gateway Outbound Drops
- **The Symptom:** Private subnet instances can ping internal nodes, but external script updates (`yum update` / `apt-get`) fail or hang indefinitely [1.1].
- **The Forensic Triage:**
  1. *Check Placement:* Ensure the NAT Gateway is physically situated inside a **Public Subnet** that routes straight to an active Internet Gateway [1.1].
  2. *Verify Route Table Binding:* Open the Private Subnet's route table and confirm that the default destination pointer maps exactly to the NAT Gateway ID: `0.0.0.0/0 -> nat-xxxxxxxxxxxxxxxxx` [1.1].
  3. *Check Allocation:* Confirm that the NAT Gateway has a valid public **Elastic IP (EIP)** bound to its interface [1.1].

### 4. Troubleshooting Inter-VPC Peering Failures
- **The Symptom:** App servers in VPC A cannot connect to microservices running in VPC B across an active peering link [1.1].
- **The Forensic Triage:**
  1. *Audit Cross-VPC Route Tables:* An active peering status token is useless unless routing tables are updated [1.1]. Open VPC A’s route table and verify that a rule routes traffic for VPC B's specific CIDR range straight to the peering connection ID (`10.200.0.0/16 -> pcx-xxxxxxxx`). Open VPC B’s route table and add the reverse rule pointing back to VPC A's block.
  2. *Audit Interlocking Security Groups:* Security Groups cannot natively reference sibling security group names across different accounts or un-peered networks. Ensure the ingress rules explicitly open target ports targeting the exact numeric CIDR block of the opposing peer network.

---

## 📸 Technical Verification Proofs

All layered firewall matrices, rule processing sequences, and triage debugging tracking records have been thoroughly compiled within this directory:

- 🔒 **Task 1: Stateful vs Stateless Rule Comparison Layouts** ──> Documenting matching evaluation paths for Security Groups and NACL systems.
- 🧱 **Task 2: Bastion Host Perimeter Routing Maps** ──> Auditing public-to-private instance jump links and connection tracing scripts.
- ⏱️ **Task 3: Forensic Network Diagnostic Triage Records** ──> Tracking automated traceroute logs and port sweep verification outputs.

---

## 📊 Solution Architecture Blueprint: The Layered Network Firewall Matrix

```text
   [ INBOUND TRAFFIC PACKET ]
               │
               ▼
 ┌───────────────────────────┐
 │ Subnet Boundary Layer     │
 ├───────────────────────────┤
 │ Network ACL (Stateless)   │ ──(Evaluates Inbound Rules 100, 200...)──> [ BLOCKED / ALLOWED ]
 └─────────────┬─────────────┘
               │
           (Permitted)
               │
               ▼
 ┌───────────────────────────┐
 │ Instance Network Card     │
 ├───────────────────────────┤
 │ Security Group (Stateful) │ ──(Evaluates Allowed Port Protocols)─────> [ DROPPED / INGESTED ]
 └─────────────┬─────────────┘
               │
               ▼
   [ Target Compute Instance ] ──(Return packet bypasses Outbound Security Group checks natively)
               │
               ▼
 ┌───────────────────────────┐
 │ Subnet Boundary Layer     │
 ├───────────────────────────┤
 │ Network ACL (Stateless)   │ ──(Requires Explicit Outbound Rule Check)─> [ DROPPED / RETURNED TO WEB ]
 └───────────────────────────┘
```
