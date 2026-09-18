terraform {
  required_version = ">= 1.5.0"

  backend "s3" {
    bucket       = "project-3-guvi-tfstate-cdf5fc5a"
    key          = "project-3-guvi/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
