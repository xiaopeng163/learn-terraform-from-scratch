# create vpc
resource "aws_vpc" "my-vpc" {

  cidr_block           = "10.0.0.0/24"
  enable_dns_hostnames = false
  tags                 = {
    Name = "my-vpc-1"
  }
}