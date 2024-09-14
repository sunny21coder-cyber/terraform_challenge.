variable "aws_region" {
  description = "The AWS region to deploy resources"
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-02da9a12d66a6b8ef"  # Ubuntu 20.04 LTS
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair name for SSH access"
  default     = "my-key-pair"
}

variable "db_instance_class" {
  description = "Instance class for the RDS MySQL instance"
  default     = "db.t3.micro"
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
}

