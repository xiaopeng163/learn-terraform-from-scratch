terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}


provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "us-west-2"
  region = "us-west-2"
}

resource "aws_vpc" "vpc1" {
  provider = aws.us-west-2
  cidr_block           = "10.1.0.0/16"
  enable_dns_hostnames = true
  tags                 = {
    Name = "terraform-vpc1"
  }
}

resource "aws_vpc" "vpc2" {

  cidr_block           = "10.1.0.0/16"
  enable_dns_hostnames = true
  tags                 = {
    Name = "terraform-vpc2"
  }
}