variable "project_name" {
  type = string
}

variable "ami_id" {
  description = "Amazon Linux 2023 AMI ID for the selected region"
  type        = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "iam_instance_profile" {
  type = string
}
