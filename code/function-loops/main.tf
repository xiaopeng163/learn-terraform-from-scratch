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

  value = aws_vpc.vpc[*].id

}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

# use count
resource "aws_vpc" "vpc" {

  count                = 2
  cidr_block           = "10.${count.index}.0.0/16"
  enable_dns_hostnames = var.enable_dns_hostnames
  tags                 = local.common_tags
}

resource "aws_vpc" "my_vpc" {

  cidr_block           = "192.168.0.0/16"
  enable_dns_hostnames = var.enable_dns_hostnames
  tags                 = local.common_tags
}

# create security group
resource "aws_security_group" "my_sg" {
  name   = "HTTP and SSH"
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}