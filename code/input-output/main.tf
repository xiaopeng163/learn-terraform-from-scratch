terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

locals {
  # Common tags to be assigned to all resources
  common_tags = {
    Company = "example.com"
    Owner   = "test"
  }
}

output "vpc_id" {

  value = aws_vpc.vpc.id

}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_regions[0]
}

resource "aws_vpc" "vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = var.enable_dns_hostnames
  tags                 = local.common_tags
}