#!/bin/bash
# =============================================================================
# AWS Systems Operations: Command Line Interface (CLI) Master Reference
# Purpose: Core Fleet Orchestration, Output Parsing & Diagnostic Queries
# =============================================================================

# 1. Initialize and configure local AWS CLI client credentials
# Generates runtime credentials folder path mapping keys (~/.aws/credentials)
aws configure

# 2. Executing a structural Dry Run to test permissions without launching resources
# Validates network routing and security boundary parameters safely
aws ec2 run-instances --image-id ami-0abcdef1234567890 --instance-type t3.micro --dry-run

# 3. Server-Side Client Filtering (--filter)
# Instructs the AWS API endpoint to isolate only instances currently running
aws ec2 describe-instances --filters "Name=instance-state-name,Values=running"

# 4. Client-Side Client Filtering & Extraction Mapping (--query)
# Uses powerful JMESPath parameters to isolate and print only Name tags and Public IPs
aws ec2 describe-instances --query "Reservations[*].Instances[*].{ID:InstanceId,PublicIP:PublicIpAddress,Name:Tags[?Key=='Name'].Value | [0]}" --output table

# 5. Auditing Cloud Storage Infrastructure (Amazon S3)
# Lists all managed storage bucket partitions owned by the active identity account
aws s3 ls

# 6. Interrogating Identity State Context (AWS IAM)
# Grabs active authentication metadata to trace current IAM user profile mappings
aws sts get-caller-identity --output json

# 7. Accessing Built-In Interactive Engine Help
# Pulls core subsystem manuals straight inside the shell prompt environment
aws ec2 help
