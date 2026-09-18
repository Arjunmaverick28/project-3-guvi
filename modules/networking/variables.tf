variable "project_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "ssh_allowed_cidr" {
  type = string
}

variable "aws_region" {
  type = string
}
