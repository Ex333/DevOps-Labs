
output "elastic_ip" {
  description = "Public Elastic IP"
  value       = aws_eip.server_ip.public_ip
}

output "ec2_instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.moj_aws.id
}

output "private_ip" {
  description = "Private IP of EC2"
  value       = aws_instance.moj_aws.private_ip
}

output "security_group_id" {
  description = "Security Group ID"
  value       = aws_security_group.ssh_access.id
}
