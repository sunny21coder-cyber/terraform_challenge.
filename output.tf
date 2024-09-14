output "ec2_private_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.web_server.private_ip
}

output "rds_endpoint" {
  description = "RDS MySQL database endpoint"
  value       = aws_db_instance.mysql.endpoint
}

