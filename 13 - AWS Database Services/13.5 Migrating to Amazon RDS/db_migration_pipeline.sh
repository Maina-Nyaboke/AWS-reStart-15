#!/bin/bash
# =============================================================================
# AWS Database Foundations: Programmatic Data Decoupling & Ingestion Pipeline
# Script Target: Subnet Group Structuring & Managed Amazon RDS Provisioning
# Target Cloud Database Engine: Managed MariaDB (Version 10.11.11)
# =============================================================================

echo "--- Initializing Programmatic Database Migration Engine ---"

# 1. Establish credential bounds across the environment shell session
# [Executed during interactive 'aws configure' step mapping access keys]

# Define immutable configuration tokens collected from lab details panel
VPC_ID="vpc-0123456789abcdef0"         # Your unique CafeVpcID
CAFE_SG_ID="sg-1234567890abcdef"       # Your unique CafeSecurityGroupID
AZ_NAME="us-west-2a"                   # Your unique CafeInstanceAZ

# 2. Build the database network perimeter security group firewall wrapper
echo "Generating database firewall security groups..."
DB_SG_ID=$(aws ec2 create-security-group \
    --group-name CafeDatabaseSG \
    --description "Security group for Cafe database" \
    --vpc-id "$VPC_ID" \
    --query "GroupId" --output text)

echo "Database Firewall SG ID: ${DB_SG_ID}"

# 3. Inject ingress rules allowing port 3306 queries cascaded from the web tier
aws ec2 authorize-security-group-ingress \
    --group-id "$DB_SG_ID" \
    --protocol tcp --port 3306 \
    --source-group "$CAFE_SG_ID"

# 4. Provision isolated multi-AZ private database subnet clusters
echo "Engineering private database network blocks..."
SUB_1_ID=$(aws ec2 create-subnet --vpc-id "$VPC_ID" --cidr-block 10.200.2.0/23 --availability-zone "${AZ_NAME}" --query "Subnet.SubnetId" --output text)
SUB_2_ID=$(aws ec2 create-subnet --vpc-id "$VPC_ID" --cidr-block 10.200.10.0/23 --availability-zone "us-west-2b" --query "Subnet.SubnetId" --output text)

echo "Private Subnet 1: ${SUB_1_ID} | Private Subnet 2: ${SUB_2_ID}"

# 5. Compile subnets into a structured database subnet group
aws rds create-db-subnet-group \
    --db-subnet-group-name "CafeDB Subnet Group" \
    --db-subnet-group-description "DB subnet group for Cafe" \
    --subnet-ids "$SUB_1_ID" "$SUB_2_ID"

# 6. Launch the fully managed database instance programmatically
echo "Dispatching Amazon RDS provisioning command..."
aws rds create-db-instance \
    --db-instance-identifier CafeDBInstance \
    --engine mariadb \
    --engine-version 10.11.11 \
    --db-instance-class db.t3.micro \
    --allocated-storage 20 \
    --availability-zone "${AZ_NAME}" \
    --db-subnet-group-name "CafeDB Subnet Group" \
    --vpc-security-group-ids "$DB_SG_ID" \
    --no-publicly-accessible \
    --master-username root --master-user-password 'Re:Start!9'

echo "RDS Instance initialized. Run describe-db-instances to capture endpoint strings."
