#!/bin/bash
# =============================================================================
# AWS Fleet Scaling & Systems Operations: Programmatic Image Blueprint Ingestion
# Tool Layer: AWS CLI v2 / Target API: Amazon EC2 (create-image)
# Purpose: Repeatable Server Seeding & Automation Baseline Configuration
# =============================================================================

echo "--- Initializing Programmatic AMI Ingestion Pipeline ---"

# 1. Dynamically resolve localized kernel region settings via IMDSv2 metadata
AZ=$(curl -s http://169.254.169)
export AWS_DEFAULT_REGION=${AZ::-1}

# 2. Extract the local server's host instance identity token directly from memory
INSTANCE_ID=$(curl -s http://169.254.169)
echo "Local Compute Node Host Trace ID: ${INSTANCE_ID}"

# Define custom semantic versioning labels for our image asset
AMI_NAME="CLI-Web-Server-Image-$(date +%Y%m%d-%H%M%S)"
DESCRIPTION="Enterprise core production machine image snapshot compiled via CLI"

echo "Executing programmatic ec2 create-image API statement..."

# 3. Trigger the image capture operation across the cloud controller plane
AMI_OUTPUT=$(aws ec2 create-image \
    --instance-id "${INSTANCE_ID}" \
    --name "${AMI_NAME}" \
    --description "${DESCRIPTION}" \
    --no-reboot \
    --region "${AWS_DEFAULT_REGION}" \
    --output json)

# Format and dump the resulting image identification metadata token to terminal
echo "Successfully registered backup asset:"
echo "${AMI_OUTPUT}" | python3 -m json.tool
