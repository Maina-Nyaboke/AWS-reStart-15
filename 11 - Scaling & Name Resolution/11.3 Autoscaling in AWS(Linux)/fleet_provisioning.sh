#!/bin/bash
# =============================================================================
# AWS Fleet Scaling & Systems Operations: Programmatic Base Image Ingestion
# Host Operating System Kernel: Amazon Linux (Command Host Shell Link)
# Target Service Container: Amazon EC2 API (Instance Provisioning & AMI Baking)
# =============================================================================

echo "--- Initializing Programmatic Ingestion Pipeline ---"

# 1. Update local AWS CLI output formatting parameters to use structured JSON strings
# [Executed during interactive 'aws configure' step to target us-west-2]

# 2. Extract localized region parameters dynamically using IMDSv2 metadata links
curl http://169.254.169 | grep region

# 3. Define and inject lab environment parameter configuration tokens
# Replace placeholders with your unique lab panel credentials variables
KEY_NAME="lab-key-pair-token"
AMI_ID="ami-0abcdef12345678"
SECURITY_GROUP="sg-0123456789abcdef0"
SUBNET_ID="subnet-0123456789abcdef0"

echo "Provisioning base WebServer instance node via the CLI..."

# 4. Launch the base compute instance passing the bootstrapping shell script text
NEW_INSTANCE_ID=$(aws ec2 run-instances \
    --key-name "$KEY_NAME" \
    --instance-type t3.micro \
    --image-id "$AMI_ID" \
    --user-data file:///home/ec2-user/UserData.txt \
    --security-group-ids "$SECURITY_GROUP" \
    --subnet-id "$SUBNET_ID" \
    --associate-public-ip-address \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=WebServer}]' \
    --query 'Instances[*].InstanceId' \
    --output text)

echo "Active Ingestion Node Track ID: ${NEW_INSTANCE_ID}"

# 5. Halt shell execution loop until the compute node transitions to a running state
aws ec2 wait instance-running --instance-ids "${NEW_INSTANCE_ID}"
echo "Base server online. Extracting public DNS connection address endpoint..."

# 6. Query the network interface configuration to grab the public DNS string
PUBLIC_DNS=$(aws ec2 describe-instances \
    --instance-ids "${NEW_INSTANCE_ID}" \
    --query 'Reservations[0].Instances[0].NetworkInterfaces[0].Association.PublicDnsName' \
    --output text)

echo "Target Public Testing URL: http://${PUBLIC_DNS}/index.php"

# 7. Bake the golden system image template file from the running compute storage blocks
echo "Baking custom reusable system AMI template..."
aws ec2 create-image \
    --name "WebServerAMI" \
    --instance-id "${NEW_INSTANCE_ID}" \
    --output json

echo "Image transaction dispatched. Move to AWS Console to build the ELB/ASG layers."
