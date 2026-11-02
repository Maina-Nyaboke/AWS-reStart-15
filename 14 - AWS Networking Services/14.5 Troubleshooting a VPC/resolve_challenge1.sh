#!/bin/bash
# =============================================================================
# AWS Network Triage: Troubleshooting Challenge #1 Resolution Script
# Target Fault: Missing Default Internet Route (0.0.0.0/0) in Public Subnet
# =============================================================================

echo "--- Resolving Network Routing Layer Boundary Faults ---"

# Define target architectural parameters (Replace with your exact lab IDs)
ROUTE_TABLE_ID="rtb-0123456789abcdef0" # Your unique VPC1 Public Route Table ID
IGW_ID="igw-0abcdef1234567890"         # Your unique VPC1 Internet Gateway ID

echo "Injecting missing edge routing rule parameters..."

# Programmatically inject the default internet route into the public route table
aws ec2 create-route \
    --route-table-id "$ROUTE_TABLE_ID" \
    --destination-cidr-block "0.0.0.0/0" \
    --gateway-id "$IGW_ID" \
    --region "us-west-2"

echo "Success. Route Table updated. Web Server HTTP traffic perimeter unlocked."
