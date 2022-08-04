terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "aws_access_key" {

  type        = string
  description = "aws access key"
  sensitive   = true
}

variable "aws_secret_key" {

  type        = string
  description = "aws secret key"
  sensitive   = true
}

variable "enable_dns_hostnames" {

  type        = bool
  description = "enable dns hostname"
  default     = true
}

locals {
  # Common tags to be assigned to all resources
  common_tags = {
    Company = "example.com"
    Owner   = "test"
  }
}

variable "dst_nsg" {
  type = map(
    object({
      protocol : string
      ports : list(number)
      from : string
      to : string
      cidr : list(string)
    })
  )
}

output "vpc_id" {

  value = aws_vpc.vpc[*].id

}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

resource "aws_vpc" "vpc" {

  count                = 2
  cidr_block           = "10.${count.index}.0.0/16"
  enable_dns_hostnames = var.enable_dns_hostnames
  tags                 = local.common_tags
}

