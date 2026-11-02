# AWS Cloud Engineering: Custom VPC Fabric Design - Classless Inter-Domain Routing (CIDR), Network Interface Topologies & Subnet Routing Tables

## 📌 Section Overview
This module documents the core networking components, address allocation mechanics, routing table parameters, and interface systems that govern **Amazon Virtual Private Cloud (VPC)** fabrics. Designing enterprise cloud environments requires an exhaustive understanding of software-defined networking, binary mask partitioning, and native routing options. This documentation establishes a comprehensive architectural blueprint for designing fully custom, network-isolated cloud environments.

---

## 🚀 The Paradigm of Software-Defined Cloud Networking

### 1. What is an Amazon VPC?
An Amazon Virtual Private Cloud (VPC) is a logically isolated virtual network partition provisioned within your AWS cloud account. It grants developers complete, absolute control over their virtual networking environment—including selecting custom IP address ranges, engineering discrete subnet blocks, mapping structural route tables, and designing stateful/stateless firewalls to isolate multi-tier application layers.

### 2. Deconstructing Classless Inter-Domain Routing (CIDR) Mathematics
IP address blocks inside an Amazon VPC are structured utilizing **CIDR Notation** strings. A CIDR block consists of a baseline starting IPv4 address followed by a forward slash and a numeric routing prefix (e.g., `10.0.0.0/16`):
- **The Binary Mask Rule:** The suffix integer (the prefix mask length) dictates exactly how many bits of the 32-bit IPv4 address are completely frozen to define the immutable network path address framework. 
- **The Capacity Calculus:** The remaining unfrozen bits define the variable host pool capacity. The total number of available IP addresses inside any given block is computed via the exponential formula:
  \[\text{Total IPs} = 2^{(32 - X)}\]
  *(Where **X** represents the CIDR suffix prefix integer value).*

### 3. The 5 Immutable Amazon Reserved VPC IP Addresses
When partitioning a subnet block inside AWS (such as allocating a `/24` subnet containing 256 theoretical addresses), **AWS automatically reserves exactly five IP addresses** for internal system operations. These addresses are un-assignable to virtual server interfaces:
- **`*.0` (Network Address):** The baseline identifier that defines the network boundary.
- **`*.1` (VPC Router Address):** Reserved for the native internal virtual software router interface managing routing traffic inside the VPC fabric.
- **`*.2` (Amazon Provided DNS):** Reserved for the native **Route 53 Resolver** (the link-local DNS server mapping lookup calls).
- **`*.3` (Future Capabilities):** Reserved by AWS for un-announced future feature expansions.
- **`*.255` (Network Broadcast Address):** The ultimate boundary marker address. While AWS does not natively use traditional link-layer network broadcasting loops, this token is reserved to maintain compatibility with standard TCP/IP networking models.
- *Operational Takeaway:* A `/24` subnet yields exactly 256 - 5 = 251 assignable host IP addresses for production EC2 instances.

---

## ⚙️ Core Networking Components & Subsystems

To steer network packets predictably across your virtual infrastructure fabric, architectures link four core subsystem units:

### 1. Subnets (Public vs. Private Realization)
A Subnet is a smaller partitioned section of a VPC's master CIDR range tied to a specific Availability Zone. Subnets dictate traffic exposure rules:
- **Public Subnet:** Mapped to an explicit route rule directing traffic straight out to an **Internet Gateway (IGW)**, and carries auto-assign public IP parameters. Hosts are directly exposed to the open web.
- **Private Subnet:** Lacks any direct routing paths to an Internet Gateway. Hosts hold internal-only private IP addresses, making them un-scannable and unreachable from the outside web.

### 2. Route Tables (The Traffic Directors)
A Route Table contains a set of discrete rules (known as *Routes*) that determine exactly where network traffic packets leaving your subnets are steered:
- **The Local Route:** Every route table contains an implicit, un-deletable default route rule covering its parent VPC CIDR block (e.g., `10.0.0.0/16 -> local`). This ensures all subnets inside the same VPC can automatically talk to each other across internal lines natively.
- **Custom Destination Routes:** Overriding the default routing logic block by attaching custom targets—such as routing all outbound internet queries (`0.0.0.0/0`) to an Internet Gateway or a NAT Gateway node.

### 3. Elastic Network Interfaces (ENIs)
An Elastic Network Interface (ENI) is a logical virtual network interface card (NIC) that can be programmatically attached to and detached from individual EC2 server instances. An ENI binds critical network telemetry attributes together: a primary private IPv4 address, one or more secondary private IPs, a volatile public IPv4 address, and one or more security group firewall definitions.

### 4. VPC DNS Options & Resolution Switches
An Amazon VPC provides two explicit boolean configuration flags to coordinate network-name resolutions:
- **`enableDnsSupport` (DNS Resolution):** Dictates whether the internal VPC resolver tool will resolve public internet queries or Amazon-provided internal domain names cleanly.
- **`enableDnsHostnames` (DNS Hostnames):** Dictates whether EC2 instances launched with public IP addresses automatically receive a matching public DNS hostname string (e.g., `://amazonaws.com`). Both switches must evaluate to `true` to unlock advanced domain resolution inside your virtual network fabric.

---

## 📸 Technical Verification Proofs

All core virtual network layouts, CIDR allocation matrices, and routing parameters have been thoroughly compiled within this workspace folder:

- 📊 **Task 1: Subnet CIDR Partitioning Blueprints** ──> Documenting exact binary address calculations and host capacity arrays.
- 📐 **Task 2: Route Table Ingress/Egress Rule Maps** ──> Auditing local routing blocks and internet gateway transit parameters.
- ⚙️ **Task 3: ENI Interface Telemetry Audits** ──> Tracking virtual network card bindings and associated security group firewalls.

---

## 📊 Solution Architecture Blueprint: The Enterprise Custom VPC Fabric

```text
 ┌───────────────────────────────────────────────────────────────────────────┐
 │ Amazon VPC Master Boundary Container (CIDR Range: 10.0.0.0/16)            │
 ├───────────────────────────────────────────────────────────────────────────┤
 │                                                                           │
 │  ┌──────────────────────────────┐       ┌──────────────────────────────┐  │
 │  │ Public Subnet (10.0.1.0/24)  │       │ Private Subnet (10.0.2.0/24) │  │
 │  ├──────────────────────────────┤       ├──────────────────────────────┤  │
 │  │ • Assignable Host IPs: 251   │       │ • Assignable Host IPs: 251   │  │
 │  │ • Auto-Assign Public IP: YES │       │ • Auto-Assign Public IP: NO  │  │
 │  │ • Route: 0.0.0.0/0 -> IGW    │       │ • Route: Internal VPC Only   │  │
 │  └──────────────┬───────────────┘       └──────────────▲───────────────┘  │
 │                 │                                      │                  │
 │                 └───────────────(Internal Route)───────┘                  │
 └───────────────────────────────────────────────────────────────────────────┘
```
