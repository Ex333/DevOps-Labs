
variable "instance_type" {
  description = "Moj EC2"
  type        = string
  default     = "t3.small"
}

variable "ami_id" {
  description = "Ubuntu AMI ID"
  type        = string
  default     = "ami-0fa06da5547f46a7d"
}

variable "region" {
  description = "Frankfurt EU"
  type        = string
  default     = "eu-central-1"
}

variable "availability_zone" {
  description = "Availability Zone"
  type        = string
  default     = "eu-central-1a"
}

variable "my_ip_cidr" {
  description = "My public IP for SSH access"
  type        = string
}
