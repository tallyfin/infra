terraform {
  required_version = ">= 1.8"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.70"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }

  backend "s3" {
    bucket = "tallyfin-terraform-state"
    key    = "production/terraform.tfstate"
    region = "eu-central-1"
  }
}

provider "aws" {
  region = "eu-central-1"

  default_tags {
    tags = {
      environment = "production"
      managed_by  = "terraform"
    }
  }
}

module "database" {
  source     = "../../modules/database"
  name       = "tallyfin-production"
  subnet_ids = var.private_subnet_ids
}
