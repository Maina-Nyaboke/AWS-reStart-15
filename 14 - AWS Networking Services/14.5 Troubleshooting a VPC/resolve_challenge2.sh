#!/bin/bash
# =============================================================================
# AWS Network Triage: Troubleshooting Challenge #2 Resolution Script
# Target Fault: Hostile Explicit Deny Rule Inside Stateless Subnet Network ACL
# =============================================================================

echo "--- Resolving Stateless Firewall Boundary Faults ---"

# Define target architectural parameters (Replace with your exact lab IDs)
NACL_ID="acl-02ce1690a8200d0d6"        # Your unique VPC1 Public Subnet NACL ID
RULE_NUMBER=40                         # The integer ID of the explicit DENY rule blocking SSH

echo "Purging hostile explicit DENY entry block out of the NACL rule matrix..."

# Programmatically delete the blocking inbound stateless rule entry
aws ec2 delete-network-acl-entry \
    --network-acl-id "$NACL_ID" \
    --rule-number "$RULE_NUMBER" \
    --ingress \
    --region "us-west-2"

echo "Success. Subnet NACL purged. Stateful SSH Port 22 clearance active."