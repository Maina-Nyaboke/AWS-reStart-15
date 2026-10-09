# AWS Data Architecture: Capstone Database Challenge - Managed Amazon RDS Provisioning, Complex Multi-Table Schemas & Relational Inner Joins

## 📌 Project Overview
This capstone module documents the final engineering implementation of the **AWS Relational Database Architecture Challenge**. To validate complete competency in database systems provisioning, network parameter isolation, schema development, transactional data seeding, and advanced data retrieval structures, we deployed a standalone **Amazon RDS MySQL database engine** inside an isolated private subnet partition. We then connected a secure Linux shell staging client over SSH, compiled two interdependent tracking tables using custom datatypes, and executed relational **INNER JOIN horizontal lookup operations** to cross-reference disjointed datasets cleanly.

---

## 🚀 Architectural Design & Relational Key Topologies

### 1. Hardened Network Layer Infrastructure
- **Private Subnet Isolation:** To secure the relational engine against malicious web vectors, the RDS database instance was deployed with public visibility disabled entirely (`Public Access = No`), anchoring its network interface strictly within private subnets inside the `Lab VPC` canvas.
- **Firewall Rule Security Groups:** Attached an inbound security group rule restricting connection traffic over port **3306** solely to traffic originating from the security group bounding the designated `LinuxServer` host instance.

### 2. Multi-Table Relational Schema Engineering
- Designed the primary master dimension table (**`RESTART`**) utilizing exact whole integer limits (`INT`) alongside length-managed character containers (`VARCHAR`) and date trackers (`DATETIME`). `StudentID` was explicitly configured as the **Primary Key (PK)** to enforce entity uniqueness.
- Engineered the tracking transactional table (**`CLOUD_PRACTITIONER`**). To establish structural relational integrity and enforce tight data dependencies between objects, the `StudentID` column inside the sub-table was bound under a strict **Foreign Key (FK)** constraint referencing the primary key of the parent `RESTART` framework.

### 3. Horizontal Query Join Mechanics (`INNER JOIN`)
Data optimization principles require data architectures to remain decoupled and normalized to eliminate cell redundancy loops. Extracting composite business insights requires executing an **`INNER JOIN`** statement block. The database processing engine reads the join syntax condition, scans both tables concurrently, filters out mismatched elements, and horizontally combines fields on matching primary-to-foreign key intersections (`ON R.StudentID = C.StudentID`), returning a clean unified data grid display instantly.

---

## 📸 Technical Verification Proofs

All core database schemas, validation queries, data transactions, and join outputs have been thoroughly executed and captured locally within this challenge workspace:

- 🏗️ **Task 1: RESTART Structural Schema Layout Definition** ──> `screenshot1_restart_schema.png`
- ✍️ **Task 2: Ten-Row Batch Transactional Ingestion Records** ──> `screenshot2_restart_insert.png`
- 🔍 **Task 3: Full Table Scan Projection Verification** ──> `screenshot3_restart_select.png`
- 🏗️ **Task 4: CLOUD_PRACTITIONER Sub-Table Schema Mapping** ──> `screenshot4_cloud_schema.png`
- ✍️ **Task 5: Five-Row Certification Data Seeding Transactions** ──> `screenshot5_cloud_insert.png`
- 🔍 **Task 6: Sub-Table Selection Extraction Telemetry Audit** ──> `screenshot6_cloud_select.png`
- 🚀 **Task 7: Relational INNER JOIN Multi-Table Horizontal Cross-Reference** ──> `screenshot7_inner_join.png`
