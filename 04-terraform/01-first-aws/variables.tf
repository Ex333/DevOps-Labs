# i  will declare the variable  here
variable "instance_type"{
    description = "Moj EC2"
    type = string
    default = "t3.micro"
}

variable "ami_id" {
    description = "ubuntu_ami_id"
    type = string
    default = "ami-0fa06da5547f46a7d"
}