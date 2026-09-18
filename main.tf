data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

module "networking" {
  source = "./modules/networking"

  project_name        = var.project_name
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  ssh_allowed_cidr    = var.ssh_allowed_cidr
  aws_region          = var.aws_region
}

module "compute" {
  source = "./modules/compute"

  project_name         = var.project_name
  ami_id               = data.aws_ami.amazon_linux.id
  instance_type        = "t3.micro"
  subnet_id            = module.networking.public_subnet_ids[0]
  security_group_id    = module.networking.web_security_group_id
  iam_instance_profile = aws_iam_instance_profile.web.name
}
