# AWS Cloud Lab: Linux Access Control Lists — Ownership (chown) and Permissions (chmod)

## 📌 Project Overview
This lab demonstrates system security configuration through Discretionary Access Control (DAC) models at the operating system level. Managing user ownership boundaries (`chown`) and file bitmask permissions (`chmod`) via absolute/symbolic modes establishes fundamental security baselines required to protect live data volumes and cloud instances.

## 🛠️ Tools Used
- **Cloud Infrastructure:** Amazon Web Services (AWS EC2)
- **Host OS:** Amazon Linux 2 (AMI)
- **Terminal Client:** Git Bash (POSIX Shell)

## 🚀 Step-by-Step Implementation

### 1. Multi-Tiered Ownership Alignments (`chown`)
Modified administrative ownership structures across nested business directory hierarchies to isolate user environments:
- Applied recursive changes via `sudo chown -R <user>:<group> <path>` parameters to align data nodes to corporate identities (CEO, Managers, and specific business departments).
- Verified ownership mappings (User and Group designation columns) via:
  ```bash
  ls -laR
  ```

### 2. Discretionary Access Configurations (`chmod`)
Practiced adjusting file manipulation privileges using alternative modification mechanics:
- **Symbolic Mode:** Used operational flag syntax (`sudo chmod g+w symbolic_mode_file`) to explicitly append write permissions onto the Group identity layer without overriding existing bit strings.
- **Absolute Mode:** Implemented octal numeric masks (`sudo chmod 764 absolute_mode_file`) to perform a total security overhaul (User=Read/Write/Execute, Group=Read/Write, Others=Read-only [4]).

### 3. Departmental Security Boundaries
- Tailored custom group isolation vectors for corporate departments (`Sales` and `Shipping`) to restrict file stream execution privileges across horizontal roles.

---

## 📸 Architectural Proof of Work

### System and Folder Ownership Realignment
![Ownership Verification](linux_chown_ownership.png)

### Symbolic vs Octal Permission Configurations Verification
![Chmod Mode Execution Matrix](linux_chmod_modes.png)

### Functional Group Permission Assignment Audits
![Assigned Roles Validation](linux_assigned_permissions.png)
