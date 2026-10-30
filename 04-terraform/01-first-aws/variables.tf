# i  will declare the variable  here
variable "instance_type" {
  description = "Moj EC2"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "ubuntu_ami_id"
  type        = string
  default     = "ami-0fa06da5547f46a7d"
}

variable "region" {
  description = "Frankfurt EU"
  type        = string
  default     = "eu-central-1"
}

variable "availability_zone" {
    description = "eu-central-1a"
    type = string
    default = "eu-central-1a"
}