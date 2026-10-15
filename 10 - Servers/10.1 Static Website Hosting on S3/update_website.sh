#!/bin/bash
# =============================================================================
# AWS Systems Operations: Automated Serverless Deployment Pipeline
# Purpose: Incremental Asset Synchronization via AWS S3 Object Storage API
# Usage: ./update-website.sh
# =============================================================================

# Define immutable environmental configuration tokens
SOURCE_DIR="/home/ec2-user/sysops-activity-files/static-website/"
BUCKET_NAME="twhitlock256" # Replace with your globally unique bucket identifier

echo "--- Initializing DevOps Static Asset Synchronization Pipeline ---"
echo "Target Source Mapping: ${SOURCE_DIR}"
echo "Destination Storage Node: s3://${BUCKET_NAME}/"

# Optional Challenge Optimization: Utilizing 'sync' instead of recursive 'cp'
# This ensures only modified files (delta differentials) cross the network plane
aws s3 sync "${SOURCE_DIR}" "s3://${BUCKET_NAME}/" --acl public-read

echo "Deployment loop complete. Refresh your Route 53 or S3 website endpoint URL."
