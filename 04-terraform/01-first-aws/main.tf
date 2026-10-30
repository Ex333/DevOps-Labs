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


resource "aws_instance" "Server_Exx" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  availability_zone = var.availability_zone

  tags = {
    Name = "Server Exx3"
  }
}