#!/bin/bash
# =============================================================================
# AWS Systems Operations: Tag-Driven Fleet Metadata Automation Engine
# Target Environment: Amazon EC2 Linux Compute Fleet (Lab VPC Subnet)
# Purpose: Programmatic Batch Version Incrementation via Text Output Loops
# =============================================================================

echo "--- Initializing Batch Metadata Mutation Pipeline ---"

# 1. Isolate and capture instance IDs matching exact Project and Environment bounds
# Uses client-side text projections to transform output arrays into space-separated fields
ids=$(aws ec2 describe-instances \
    --filter "Name=tag:Project,Values=ERPSystem" "Name=tag:Environment,Values=development" \
    --query 'Reservations[*].Instances[*].InstanceId' \
    --output text)

echo "Target Non-Compliant/Development Node IDs Isolated: $ids"

# 2. Execute programmatic batch creation to overwrite the Version metadata metadata parameters
if [ -n "$ids" ]; then
    echo "Overwriting Version tags to baseline 1.1 across target fleet..."
    aws ec2 create-tags --resources $ids --tags 'Key=Version,Value=1.1'
    echo "Success. Fleet tracking updated. Verify using filtered describe statements."
else
    echo "No matching compute instances isolated inside the execution envelope."
fi