# AWS Cloud Lab: Introduction to Amazon Linux AMI & CLI Basics

## 📌 Project Overview
As part of my AWS re/Start journey, this lab demonstrates how to securely connect to a remote cloud server using industry-standard tools and navigate the Linux command-line environment. 

## 🛠️ Tools Used
- **Cloud Provider:** Amazon Web Services (AWS)
- **Compute:** Amazon EC2 (t3.micro running Amazon Linux AMI)
- **Terminal Client:** Git Bash 
- **Operating System:** Linux 

## 🚀 Step-by-Step Implementation

### 1. Preparing Security Credentials
- Initiated the AWS lab sandbox environment in Vocareum.
- Downloaded the private key pair file (`labsuser.pem`).
- Retrieved the public IPv4 address of the EC2 Command Host.

### 2. Establishing the Secure SSH Connection via Git Bash
- Navigated to the folder holding the key pair.
- Restricted private key permissions to prevent exposure:
  ```bash
  chmod 400 labsuser.pem

### Visual Proof of Deployment
![AWS Linux Terminal Connection](images/terminalproof.png)

### Interaction with Linux Manual pages
![AWS Linux Terminal Connection](images/manpage.png)




