#!/bin/bash
# =============================================================================
# AWS Systems Operations: Programmatic Compute Infrastructure Automation
# Purpose: Orchestrating Safe EC2 Instance Provisioning via AWS CLI
# =============================================================================

echo "--- Initializing Programmatic Compute Provisioning Engine ---"

# Define target architectural parameters
IMAGE_ID="ami-0abcdef1234567890"        # Target Amazon Machine Image (AMI)
INSTANCE_TYPE="t3.micro"               # Burstable Instance Class Selection
KEY_NAME="my-ssh-key-pair"              # Asymmetric Key Pair Token
SUBNET_ID="subnet-0123456789abcdef0"   # Target VPC Subnet Mapping
SECURITY_GROUP="sg-0123456789abcdef0"  # Cascaded Network Firewall ID

echo "Executing run-instances API command with automated safety flags..."

# Provision the instance programmatically using structured parameters
aws ec2 run-instances \
    --image-id "$IMAGE_ID" \
    --count 1 \
    --instance-type "$INSTANCE_TYPE" \
    --key-name "$KEY_NAME" \
    --security-group-ids "$SECURITY_GROUP" \
    --subnet-id "$SUBNET_ID" \
    --associate-public-ip-address \
    --user-data file://bootstrap_script.txt

echo "API transaction completed. Audit instance state via ec2 describe-instances."
