
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}


data "aws_ssm_parameter" "ami_ubuntu" {
  name = "/aws/service/canonical/ubuntu/server/resolute/stable/current/amd64/hvm/ebs-gp3/ami-id"
}

# Create an EC2 instance
resource "aws_instance" "Ex3_ec2_instance" {
  ami           = data.aws_ssm_parameter.ami_ubuntu.value
  instance_type = "t3.micro"

  tags = {
    Name = "Ex3-ubuntu-devops"
  }
}
