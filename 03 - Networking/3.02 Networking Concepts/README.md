# AWS Cloud Networking: Networking Concepts, Topologies, Management & Protocols

## 📌 Project Overview
This module explores the advanced configuration states, layout designs, and management protocols that govern data routing and structural connectivity across enterprise computer networks. Understanding structural layouts, lifecycle management monitoring, and transport rule boundaries maps directly to provisioning highly available, fault-tolerant infrastructure inside AWS.

---

## 🚀 Core Technical Disciplines Evaluated

### 1. Computer Networks (Architecture Types)
- **Client-Server Architecture:** Centralized model where resource servers provide computational assets or database pools to distributed client systems. (Maps to an Amazon EC2 web server provisioning traffic to web browsers).
- **Peer-to-Peer (P2P) Architecture:** Decentralized layout model where every node on the network shares equivalent capabilities, hosting responsibilities, and routing workloads simultaneously without centralized control matrices.

### 2. Network Topologies (Physical & Logical Layouts)
Analyzed structural arrangement patterns used to connect network devices:
- **Bus Topology:** Devices chained along a single central backbone cable line. A single break drops the complete link.
- **Ring Topology:** Nodes linked sequentially in a circular data path where tokens move in a single direction.
- **Star Topology:** Every independent station feeds directly into a centralized hardware switch or hub. (Maps directly to an AWS VPC where individual subnets feed into local infrastructure routing tables).
- **Mesh Topology:** Highly redundant interconnect layout where nodes link to multiple alternative siblings, providing maximum fault tolerance and high availability pathways.

### 3. Network Management (Operations & System Health)
- **Performance & Fault Isolation Monitoring:** Implementing systematic monitoring systems to track bandwidth depletion limits, data collisions, and packet degradation. (Core prerequisite concept for mapping cloud infrastructure health metrics inside AWS CloudWatch).
- **Configuration Security Boundaries:** Managing network structural deployments, resource provisioning changes, and inventory catalogs to secure structural access parameters across an enterprise framework.

### 4. Core Network Protocols (The Traffic Rules Suite)
Deconstructed the foundational messaging protocols that standardize web communications:
- **TCP (Transmission Control Protocol):** Connection-oriented, highly reliable transport layer protocol that utilizes a 3-way handshake sequence (`SYN`, `SYN-ACK`, `ACK`) to ensure strict error checking and guaranteed data delivery.
- **UDP (User Datagram Protocol):** Connectionless, lightweight transport protocol that streams data packets directly to a target without tracking reception states, optimizing performance speeds for voice, video, and live telemetry tracking.
- **DNS (Domain Name System):** The internet's phone book, which resolves human-readable string domains (e.g., `amazon.com`) into routable logical machine IP coordinates.
- **DHCP (Dynamic Host Configuration Protocol):** Automated network management utility that dynamically leases out valid IP configurations, subnet masks, and default gateways to local clients inside a subnet automatically.
