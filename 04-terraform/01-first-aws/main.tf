
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

# 1. DEFAULT VPC
data "aws_vpc" "default" {
  default = true
}

# 2. SSH KEY PAIR
resource "aws_key_pair" "ex3_key" {
  key_name   = "ex3-aws-key"
  public_key = file(pathexpand("~/.ssh/id_ed25519.pub"))
}

# 3. SECURITY GROUP
resource "aws_security_group" "ssh_access" {
  name        = "ex3-ssh-access"
  description = "Allow SSH from my IP"
  vpc_id      = data.aws_vpc.default.id

  # INBOUND - incoming traffic
  ingress {
    description = "SSH from my computer"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # OUTBOUND - outgoing traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Ex3-SSH-Security-Group"
  }
}

# 4. EC2 INSTANCE
resource "aws_instance" "moj_aws" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  availability_zone = var.availability_zone

  key_name = aws_key_pair.ex3_key.key_name

  root_block_device {
    volume_size = 40
    volume_type = "gp3"
  }

  vpc_security_group_ids = [
    aws_security_group.ssh_access.id
  ]

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  tags = {
    Name        = "Ex3_EC2"
    Environment = "dev"
    Project     = "Ex3-DevOps"
  }
}

# 5. ELASTIC IP
resource "aws_eip" "server_ip" {
  domain = "vpc"

  tags = {
    Name = "Ex3-Elastic-IP"
  }
}

# 6. ASSOCIATE EIP WITH EC2
resource "aws_eip_association" "server_ip" {
  instance_id   = aws_instance.moj_aws.id
  allocation_id = aws_eip.server_ip.id
}
