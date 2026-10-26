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

resource "aws_instance" "my_server" {
  ami           = "AMI_ID"
  instance_type = "t3.micro"
}