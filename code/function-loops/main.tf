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
