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
  availability_zone = "eu-central-1a"

  tags = {
    Name = "Server_Exx1231!!"
  }
}