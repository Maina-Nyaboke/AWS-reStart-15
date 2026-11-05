# AWS Cloud Engineering: Capstone Lab Challenge - Full-Stack Declarative Provisioning, Asynchronous Infrastructure Orchestration & Software-Defined Network Topologies

## 📌 Project Overview
This final capstone module documents the successful architectural execution and deployment validation of the **AWS re/Start Top-Level Cloud Infrastructure Challenge Lab**. To demonstrate absolute engineering self-sufficiency and operational command over automated cloud networks, we designed and deployed a comprehensive full-stack infrastructure deployment template using AWS CloudFormation. This documentation details the mathematical partition calculations of custom Classless Inter-Domain Routing (CIDR) blocks, edge gateway attachment bindings, multi-tier subnet route tables, stateful firewall security parameters, and dynamic compute node deployments compiled completely via code manifests.

---

## 🚀 The Capstone Architecture Blueprint: Software-Defined Infrastructure

This challenge requires moving completely past managed cloud defaults to construct an entire infrastructure stack layout from a blank state. The codebase maps out a secure, high-durability operational design model built on six interconnected architectural layers:

### 1. Isolated Network Core (Amazon VPC)
- **The Design:** Initiates a logically isolated virtual private network grid wrapper carrying a custom manual CIDR address allocation block of `10.50.0.0/16`. It establishes a software-defined container space that shields all subsequent computing operations.

### 2. Edge Routing Clearance (Internet Gateway)
- **The Design:** Provisions a bidirectional edge communications module (**Internet Gateway / IGW**) and programmatically executes a network attachment binding linking it directly onto the custom VPC core. This enables network traffic packets inside the network grid to handshake securely with the public internet web space.

### 3. Subnet Mask Partitioning & Routing Tables
- **The Design:** Partitions the network address space downward to allocate a dedicated subnet zone (`10.50.1.0/24`), enabling auto-assign public IPv4 properties. It compiles an explicit **Public Route Table** tracking a static default internet routing rule (`0.0.0.0/0 -> IGW`), binding it directly to the subnet to activate its public transit edge state.

### 4. Stateful Firewall Hardening (Security Groups)
- **The Design:** Establishes an instance-level firewall perimeter wrapper (`CapstoneSecurityGroup`). It enforces strict protocol compliance rules by configuring an explicit inbound ingress statement that authorizes **Secure Shell (SSH) connection requests over TCP Port 22 globally from anywhere (`0.0.0.0/0`)**, satisfying the core system criteria parameters.

### 5. Elastic Compute Fleet Placement (Amazon EC2)
- **The Design:** Anchors a burstable, resource-optimized **`t3.micro` computing instance** node named `CapstoneWebServer` securely inside the partitioned subnet layer. The server instance maps its virtual network interface card (ENI) directly onto the custom security group firewall, allowing automated, low-overhead code processing runs.

---

## 🛠️ Step-by-Step Systems Engineering Execution Lifecycle

### 1. Account Discovery & CLI Handshaking
- Authenticated the browser-native Linux terminal shell environment, executing low-level security tokens to inspect permissions and track account identity variables:
  ```bash
  aws sts get-caller-identity
  ```

### 2. Template Drafting & Syntactical Validation
- Formulated the declarative infrastructure code blueprint `capstone_deployment.template.yml` using the **YAML serialization syntax**, meticulously ensuring whitespace indentation rules and double-space indentation properties across mapping headers.
- Embedded custom parameters to handle dynamic CIDR block variations and linked resources together using the **`!Ref` and `!GetAtt` intrinsic functions** to eliminate hardcoded configuration traps.

### 3. Dispatching Stack Ingestion & Console Auditing
- Dispatched an explicit programmatic command string via the browser shell utility client to ingest the template manifest directly into the AWS CloudFormation service plane, naming the active target orchestration stack container **`CapstoneVpcFleetStack`**:
  ```bash
  aws cloudformation create-stack \
    --stack-name CapstoneVpcFleetStack \
    --template-body file://capstone_deployment.template.yml \
    --capabilities CAPABILITY_NAMED_IAM
  ```
- Switched instantly to the AWS CloudFormation Management Dashboard to monitor live event traces. The automated provisioning engine parsed the declarative file, computed the resource dependency trees, built the networking skeleton first, attached the edge gateways, applied firewall rules, and successfully spun up the compute instance node, moving the complete stack status into a final, flawless green **`CREATE_COMPLETE`** state table.

### 4. Verification & Environmental Auditing
- **VPC Layer Check:** Accessed the Amazon VPC dashboard, confirming the successful generation of `CapstoneVPC` matching the exact `10.50.0.0/16` block allocation. Verified that `CapstoneIGW` was fully active and securely attached.
- **EC2 Compute Layer Check:** Advanced to the Amazon EC2 Instances table pane, confirming that `CapstoneWebServer` was fully active, running inside a `t3.micro` performance class, and carrying an auto-allocated public IPv4 address string to finalize a flawless full-stack capstone rollout.

---


