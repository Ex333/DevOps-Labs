
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# 1. SSH KEY PAIR
resource "aws_key_pair" "ex3_key" {
  key_name   = "ex3-aws-key"
  public_key = file(pathexpand("~/.ssh/id_ed25519.pub"))
}

# 2. EC2 INSTANCE
resource "aws_instance" "moj_aws" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  availability_zone = var.availability_zone

  key_name = aws_key_pair.ex3_key.key_name

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  tags = {
    Name        = "Server Ex3333"
    Environment = "dev"
    Project     = "Ex3-DevOps"
  }
}

# 3. ELASTIC IP
resource "aws_eip" "server_ip" {
  domain = "vpc"

  tags = {
    Name = "Ex3-Elastic-IP"
  }
}

# 4. ASSOCIATE EIP WITH EC2
resource "aws_eip_association" "server_ip" {
  instance_id   = aws_instance.moj_aws.id
  allocation_id = aws_eip.server_ip.id
}
