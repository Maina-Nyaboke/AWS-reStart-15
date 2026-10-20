#!/bin/bash
# =============================================================================
# AWS Systems Operations Lab: Installing & Configuring the AWS CLI v2
# Host Operating System Kernel: Red Hat Enterprise Linux (RHEL) Instance
# Target Security Domain: Identity Access Management (IAM) API Verification
# =============================================================================

# Task 2: Pull and install the official AWS CLI v2 binary bundle package
curl "https://amazonaws.com" -o "awscliv2.zip"
unzip -u awscliv2.zip
sudo ./aws/install

# Verify environment path mapping status
aws --version

# Task 4: Establish the secure programmatic credentials pipeline connection
# [Prompts for Access Key ID, Secret Key, Region: us-west-2, Format: json]
aws configure

# Task 5: Execute an API query to test identity access pathways
aws iam list-users

# =============================================================================
# Activity 1 Challenge Resolution: Programmatic Policy Extraction
# =============================================================================

# 1. Audit local customer-managed policies to pinpoint the target ARN string
aws iam list-policies --scope Local

# 2. Extract specific default version permissions and pipe direct to a JSON file
aws iam get-policy-version \
    --policy-arn arn:aws:iam::038946776283:policy/lab_policy \
    --version-id v1 > lab_policy.json

# 3. Read and print local disk file to verify data integrity tracking
cat lab_policy.json
