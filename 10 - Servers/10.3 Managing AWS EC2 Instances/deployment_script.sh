#!/bin/bash
# =============================================================================
# AWS Systems Operations: Programmatic Fleet Lifecycle Management
# Script Target: Token Resolution & Automated EC2 Provisioning
# =============================================================================

# 1. Resolve localized region using IMDSv2 metadata links
AZ=`curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone`
export AWS_DEFAULT_REGION=\${AZ::-1}

# 2. Query SSM Parameter Store to grab the latest validated Amazon Linux 2 AMI ID
AMI=\$(aws ssm get-parameters --names /aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 --query 'Parameters[0].[Value]' --output text)
echo "Target AMI Extracted: \${AMI}"

# 3. Pull public network fabric subnets and security group ID tokens
SUBNET=\$(aws ec2 describe-subnets --filters 'Name=tag:Name,Values=Public Subnet' --query Subnets[].SubnetId --output text)
SG=\$(aws ec2 describe-security-groups --filters Name=group-name,Values=WebSecurityGroup --query SecurityGroups[].GroupId --output text)

# 4. Pull bootstrapping files from source and launch the instance programmatically
wget https://aws-tc-largeobjects.s3.us-west-2.amazonaws.com/CUR-TF-100-RSJAWS-1-23732/171-lab-JAWS-create-ec2/s3/UserData.txt

INSTANCE=\$(aws ec2 run-instances \
  --image-id \$AMI \
  --subnet-id \$SUBNET \
  --security-group-ids \$SG \
  --user-data file:///home/ec2-user/UserData.txt \
  --instance-type t3.micro \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Web Server}]' \
  --query 'Instances[*].InstanceId' \
  --output text)

echo "Success. Active Instance Node Track ID: \${INSTANCE}"
