# AWS Cloud Governance: Cost Optimization & Sizing - Decommissioning Local Database Stacks, Programmatic Instance Right-Sizing & Multi-Tier TCO Pricing Models

## 📌 Section Overview
This module documents the practical engineering implementation of **Compute Fleet Right-Sizing, Operating System Package Decommissioning, Storage Footprint Minimization, and Total Cost of Ownership (TCO) Estimation Modeling** [16.4]. Following a successful database migration to a managed relational tier, we executed system package removals to purge an inactive database daemon (`mariadb-server`), utilized the AWS CLI to execute dynamic instance attribute modifications to down-size compute hardware from `t3.small` to a cheaper `t3.micro` profile, and built full platform cost estimation blueprints using the **AWS Pricing Calculator** to calculate projected cloud expenditure reductions [16.4].

---

## 🚀 The Principles of Cloud Cost Optimization & Right-Sizing

Transitioning legacy architectures into highly optimized cloud networks requires continuous enforcement of **Financial Operations (FinOps) Right-Sizing** standards [16.4]. 

### 1. Eliminating Package Bloat & Reclaiming Storage Blocks
When a multi-tier web application migrates its data storage layer out of a local standalone instance and onto a managed engine (such as Amazon RDS), leaving the original database software active on the compute server introduces significant architectural risks [16.4]:
- **Resource Exhaustion:** The idle database process continue to consume background system memory (RAM) and CPU cycles unnecessarily.
- **Storage Footprint Waste:** Legacy, decommissioned database transaction logs and binary files continue to fill up local block storage volumes, driving up Amazon EBS storage costs [16.4].
- *The Solution:* Running explicit administrative package purges (`yum remove`) drops the dead server processes completely and frees up critical disk sectors, allowing the storage profile to be scaled down safely [16.4].

### 2. Programmatic Instance Right-Sizing Calculus
A primary advantage of cloud compute virtualization over traditional on-premises hardware is the ability to change machine capacities dynamically with near-zero latency [16.4]. 
- **The Right-Sizing Rule:** Compute instance sizes must strictly match the live active processing load of the software stack. 
- **The Optimization Flow:** Because the heavy transactional data-processing workload was moved entirely to an independent Amazon RDS cluster, the frontend web server instance required far fewer internal hardware resources [16.4]. Shutting down the machine temporarily and dispatching a programmatic attribute update (`modify-instance-attribute`) to downsize the instance profile type from `t3.small` to `t3.micro` slashes platform expenditures while keeping application performance perfectly stable [16.4].

---

## 🛠️ Step-by-Step FinOps Infrastructure Optimization Lifecycle

### 1. Operating System Infiltration & Package Purges
- Connected securely into the active `CafeInstance` backend operating system kernel via an encrypted remote SSH tunnel connection [16.4].
- Dispatched administrative system commands to permanently kill the localized database process daemon and completely erase the server binaries from the local hard drive storage sectors [16.4]:
  ```bash
  sudo systemctl stop mariadb
  sudo yum -y remove mariadb-server
  ```
- Successfully verified completion, recovering massive block storage capacity allocations off the machine [16.4].

### 2. Programmatic Attribute Modification & Right-Sizing
- Logged into a separate terminal shell matching the `CLI Host` instance and ran an advanced filtered query string to isolate the target application server identity token [16.4]:
  ```bash
  aws ec2 describe-instances --filters "Name=tag:Name,Values=CafeInstance" --query "Reservations[*].Instances[*].InstanceId"
  ```
- Command-directed the cloud controller plane to execute a clean, automated system shutdown over the instance to prepare it for modification [16.4]:
  ```bash
  aws ec2 stop-instances --instance-ids i-0abcdef1234567890
  ```
- Passed an explicit JSON-wrapped configuration string to mutate the machine's hardware profile type, shrinking its processing class to a cheaper tier [16.4]:
  ```bash
  aws ec2 modify-instance-attribute --instance-id i-0abcdef1234567890 --instance-type "{\"Value\": \"t3.micro\"}"
  ```
- Restarted the application compute instance (`start-instances`) and ran periodic descriptive telemetry loops to monitor the transition until the state engine verified a green **`running`** check string [16.4].
- **Web Tier Validation:** Loaded the newly assigned public DNS address endpoint path inside an external web browser tab (`http://<IP>/cafe`), executing menu shopping transactions to confirm 100% data tier interoperability and application stability [16.4].

### 3. Total Cost of Ownership (TCO) Mathematical Modeling
- Formulated an analytical price profile canvas inside the official **AWS Pricing Calculator** interface [16.4].
- **Modeling the Baseline (Pre-Optimization):** Configured a cost model tracking a full 100% constant utilization `t3.small` Linux compute instance carrying a 40 GB `gp2` EBS block storage volume coupled to a Single-AZ `db.t3.micro` MariaDB RDS instance, compiling an aggregate baseline invoice of **\$35.60 per month** [16.4].
- **Modeling the Target (Post-Optimization):** Modified the active cost metrics to reflect your infrastructure right-sizing adjustments—down-sizing the instance profile type to a cheaper **`t3.micro`** class and compressing the storage volume criteria down to **20 GB** [16.4].
- **The Financial Optimization Output:** The calculation engine updated the metrics live, outputting a highly optimized monthly total of **\$25.18** [16.4]. Exported the complete itemized dataset out as a clean corporate CSV log, proving an immediate, scalable **\$10.42 month-over-month platform budget reduction (29% Cost Savings)** across the single app track alone [16.4]!

---

## 📸 Technical Verification Proofs

### Reclaiming Storage Assets: Executing Kernel-Level Removal to Decommission Local Database Server Stacks
![db_removed](./mariadb_decommissioned.png)

### Programmatic Fleet Sizing: Utilizing the AWS CLI to Successfully Right-Size the Compute Instance to a t3.micro Class
![instance_rightsized](./instance_rightsized.png)

### Total Cost of Ownership Modeling: Compiling Optimized Structural Estimates via the AWS Pricing Calculator
![tco_model](./pricing_calculator_tco.png)
