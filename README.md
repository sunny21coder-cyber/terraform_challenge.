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
   ```
   aws configure

Components
----------

### VPC & Networking:

-   **VPC**: A virtual private cloud with a CIDR block of `10.0.0.0/16`.
-   **Public Subnets**: Two public subnets, one in each availability zone (`us-east-1a` and `us-east-1b`).
-   **Internet Gateway**: Provides internet access to resources in the public subnets.
-   **Route Table**: Routes traffic through the internet gateway for both subnets.

### EC2 Instance:

-   **Instance Type**: `t2.micro` (AWS Free Tier eligible).
-   **AMI**: Ubuntu Server 20.04 LTS (ensure the AMI ID is correct for your region).
-   **Security Group**: Allows HTTP (port 80) and SSH (port 22) access from anywhere.

### RDS MySQL Database:

-   **Instance Type**: `db.t4g.micro` or `db.t3.micro` (smallest RDS instance sizes).
-   **Engine**: MySQL 8.0.x.
-   **Security Group**: Allows MySQL traffic (port 3306) only from the EC2 instance's security group.

### Security Groups:

-   **Web Security Group**: This security group allows HTTP and SSH access to the EC2 instance.
-   **DB Security Group**: This security group allows traffic from the EC2 instance to the RDS MySQL instance.

Prerequisites
-------------

Before you start, ensure you have the following tools installed and configured:

1.  **Terraform**: Download and install from [here](https://www.terraform.io/downloads.html).

2.  **AWS CLI**: Install and configure it with proper AWS credentials. You can configure it by running:

  

     

    `aws configure`

    You will need your AWS Access Key ID, Secret Access Key, and preferred region (e.g., `us-east-1`).

3.  **AWS Account**: Ensure you have permissions to create VPCs, EC2 instances, RDS instances, and other resources.

Setup
-----

### Step 1: Clone the repository

First, clone this repository to your local machine:



 

`git clone https://github.com/your-username/terraform-aws-infra.git
cd terraform_project`

### Step 2: Initialize Terraform

Initialize Terraform to download the necessary provider plugins:



 

`terraform init`

### Step 3: Customize Variables (Optional)

You can customize certain values by editing the `variables.tf` file. For instance, you can change:

-   The AWS region
-   The AMI ID for the EC2 instance
-   The EC2 instance type
-   The database credentials and instance type

Here are some variables you can modify in `variables.tf`:



 

`variable "aws_region" {
  description = "The AWS region to deploy resources"
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-0d5eff06f840b45e9"  # Example AMI for Ubuntu 20.04 in us-east-1
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  default     = "t2.micro"
}

variable "db_instance_class" {
  description = "Instance class for the RDS MySQL instance"
  default     = "db.t4g.micro"
}

variable "db_name" {
  description = "Name of the MySQL database"
  default     = "myappdb"
}

variable "db_username" {
  description = "Username for the MySQL database"
  default     = "admin"
}

variable "db_password" {
  description = "Password for the MySQL database"
  default     = "password123"
  sensitive   = true
}`

### Step 4: Plan the Infrastructure

To see what Terraform will create without actually provisioning resources, run:



 

`terraform plan`

This will display a summary of the resources Terraform plans to create, such as the EC2 instance, RDS instance, VPC, subnets, and security groups.

### Step 5: Apply the Terraform Configuration

Once you're satisfied with the planned infrastructure, apply the configuration to create the resources:



 

`terraform apply`

Terraform will ask for confirmation before proceeding. Type `yes` to begin the provisioning process. Once the process is complete, Terraform will output useful information such as:

-   **EC2 Public IP**: The public IP address of the EC2 instance for SSH or web access.
-   **RDS Endpoint**: The endpoint for connecting to the MySQL database.

### Step 6: Access the EC2 Instance

You can SSH into the EC2 instance using the private key generated by Terraform:



 

`ssh -i private_key.pem ubuntu@<EC2_PUBLIC_IP>`

Make sure to replace `<EC2_PUBLIC_IP>` with the actual public IP output by Terraform.

### Step 7: Destroy the Infrastructure

When you no longer need the infrastructure, you can destroy all the resources created by Terraform to avoid incurring further costs:



 

`terraform destroy`

Terraform will prompt for confirmation before tearing down all resources.

Variables
---------

You can configure the infrastructure by modifying the following variables in `variables.tf`:

| Variable | Description | Default Value |
| --- | --- | --- |
| `aws_region` | AWS region to deploy the resources | `us-east-1` |
| `ami_id` | AMI ID for the EC2 instance | `ami-0d5eff06f840b45e9` |
| `instance_type` | EC2 instance type | `t2.micro` |
| `key_name` | Key pair name for SSH access | `my-key-pair` |
| `db_instance_class` | RDS instance class | `db.t4g.micro` |
| `db_name` | Name of the MySQL database | `myappdb` |
| `db_username` | Username for the MySQL database | `admin` |
| `db_password` | Password for the MySQL database | `password123` |

Outputs
-------

The following outputs will be displayed after successful provisioning:

| Output Name | Description |
| --- | --- |
| `ec2_public_ip` | Public IP address of the EC2 instance |
| `rds_endpoint` | Endpoint of the MySQL RDS instance |
