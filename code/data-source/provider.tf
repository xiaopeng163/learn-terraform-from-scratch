terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
    consul = {
      source = "hashicorp/consul"
      version = "2.15.1"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  #access_key = var.aws_access_key
  #secret_key = var.aws_secret_key
  region     = var.aws_region
}

provider "consul" {
  datacenter = "dc1"
  token      = "9dbfa2c5-ad4a-0635-c98d-e0634cb65d86"
}
