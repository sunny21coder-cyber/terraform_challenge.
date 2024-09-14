# Terraform AWS Infrastructure Setup

This project demonstrates how to provision basic infrastructure on AWS using Terraform. The infrastructure consists of:
- An **EC2 instance** running a basic web server.
- An **RDS MySQL database** for storing application data.

## Project Structure

```plaintext
terraform_challenge/
├── main.tf          # Terraform configuration for provisioning AWS resources
├── variables.tf     # Defines input variables for customization
├── outputs.tf       # Defines output values like EC2 public IP and RDS endpoint
├── README.md        # Project documentation



# Terraform AWS Infrastructure Setup

This project demonstrates how to provision basic infrastructure on AWS using Terraform. The infrastructure consists of:
- An **EC2 instance** running a basic web server.
- An **RDS MySQL database** for storing application data.

## Components

### EC2 Instance:
- **Instance Type**: `t2.micro` (AWS Free Tier eligible).
- **AMI**: Ubuntu Server 20.04 LTS (ensure the AMI ID is correct for your region).
- **Security Group**: Allows HTTP (port 80) and SSH (port 22) access from anywhere.

### RDS MySQL Database:
- **Instance Type**: `db.t4g.micro` or `db.t3.micro` (smallest RDS instance sizes).
- **Engine**: MySQL 8.0.x.
- **Security Group**: Allows MySQL traffic (port 3306) only from the EC2 instance's security group.

## Prerequisites

Make sure you have the following tools installed and configured:

1. **Terraform**: Download and install from [here](https://www.terraform.io/downloads.html).
2. **AWS CLI**: Install and configure it with proper AWS credentials. You can configure it by running:
   ```bash
   aws configure

