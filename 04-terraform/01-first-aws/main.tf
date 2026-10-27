terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider aws {
  region = "eu-central-1"
}

resource "aws_instance" "ex3-server-1" {
  ami               = "ami-0fa06da5547f46a7d"
  instance_type      = "t3.micro"
}