# AWS Cloud Networking: Foundations, Core Components & The 7-Layer OSI Model

## 📌 Project Overview
This module establishes the core theoretical architectural baselines of computer networking and hardware topologies. Mastering legacy networking components and data transmission boundaries forms the prerequisite engineering framework required to design, deploy, scale, and troubleshoot virtual networks inside the AWS cloud environment.

---

## 🚀 Core Architectural Components Evaluated

### 1. Foundational Networking Concepts
- **Data Transmission Protocols:** Explored how data packages transit across localized and global networks using the TCP/IP stack protocol suite.
- **Addressing Topologies:** Studied the operational mechanics behind physical Media Access Control (MAC) addresses used for hop-by-hop local data tracking versus logical Internet Protocol (IP) addresses utilized for global source-to-destination routing paths.
- **Network Classification Structures:** Evaluated the architectural variances between Local Area Networks (LAN) and Wide Area Networks (WAN).

### 2. Physical & Logical Networking Components
Investigated the structural differences between essential enterprise hardware appliances and their virtual cloud counter-parts:
- **Hubs & Repeaters:** Layer 1 devices that blindly repeat electrical or optical bits across a medium, creating a single massive collision domain.
- **Bridges & Switches:** Layer 2 hardware nodes that inspect incoming data frames, map physical MAC addresses to dynamic lookup matrices, and isolate collision boundaries per hardware port interface.
- **Routers:** Layer 3 intelligent routing nodes that inspect packets, compute optimal path navigation strategies across separate logical networks using IP address routing tables, and establish major network security boundaries.

### 3. Deconstructing the 7-Layer OSI Model Reference Framework
Analyzed how data streams undergo automated serialization and encapsulation from software logic down to physical signaling wires:

| OSI Layer | Focus Layer Name | Data Protocol Unit | Core Functionality & Purpose |
| :---: | :--- | :--- | :--- |
| **7** | **Application** | Data Stream | The software interface layer interacting directly with the end user (HTTP, HTTPS, SSH, FTP). |
| **6** | **Presentation** | Data Stream | Manages character encoding translation, data formatting transformations, and native cryptographic encryption layers. |
| **5** | **Session** | Data Stream | Orchestrates, maintains, synchronizes, and cleanly terminates long-term connection channels between local and remote processes. |
| **4** | **Transport** | Segments (TCP) / Datagrams (UDP) | Enforces end-to-end logical connections, windowing flow controls, error checking, and tracks source/destination port allocations. |
| **3** | **Network** | Packets | Determines logical routing, packet addressing paths, and computes hop paths across distinct subnets using logical IPv4/IPv6 matrices. |
| **2** | **Data Link** | Frames | Packages bitstreams into structural frames, manages error detection over physical wire links, and maps local hardware MAC addresses. |
| **1** | **Physical** | Bits / Electrical Volts | The physical transmission medium (Copper wires, Fiber-optic light waves, radio frequencies) carrying raw unformatted bit arrays. |

---

## 📊 Structural Mapping: OSI Reference Model vs AWS Infrastructure
To systematically troubleshoot architecture in production environments, legacy data center paradigms map directly onto virtualized AWS software-defined resources:

```text
  [ OSI LAYER ]                          [ AWS CLOUD EQUIVALENT INFRASTRUCTURE ]
┌───────────────┐                       ┌────────────────────────────────────────┐
│ Layer 7 / 6   │ ────────────────────> │ Web Apps, Apache HTTPD Servers, APIs   │
├───────────────┤                       ├────────────────────────────────────────┤
│ Layer 5       │ ────────────────────> │ Amazon EC2 Host Instances              │
├───────────────┤                       ├────────────────────────────────────────┤
│ Layer 4       │ ────────────────────> │ Stateful Security Groups & Stateless NACLs│
├───────────────┤                       ├────────────────────────────────────────┤
│ Layer 3       │ ────────────────────> │ Route Tables, Internet Gateways, Subnets│
├───────────────┤                       ├────────────────────────────────────────┤
│ Layer 2 / 1   │ ────────────────────> │ AWS Global Regions & Availability Zones│
└───────────────┘                       └────────────────────────────────────────┘
```