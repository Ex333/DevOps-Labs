
output "elastic_ip" {
  description = "Public Elastic IP of EC2"
  value       = aws_eip.server_ip.public_ip
}

output "ec2_instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.moj_aws.id
}
