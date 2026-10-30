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


resource "aws_instance" "Server_Exx" {
  ami               = "ami-0fa06da5547f46a7d"
  instance_type     = var.instance_type
  availability_zone = "eu-central-1c"

  tags = {
    Name = "Server_Exx1231!!"
  }
}