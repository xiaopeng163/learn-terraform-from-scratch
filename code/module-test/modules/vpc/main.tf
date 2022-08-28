# create vpc
resource "aws_vpc" "my_vpc" {
  cidr_block           = var.aws_vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
}

# Create a Subnet
resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = cidrsubnet(var.aws_vpc_cidr_block, 8, 1)
}

# internet gateway
resource "aws_internet_gateway" "my_internet_gateway" {
  vpc_id = aws_vpc.my_vpc.id

}
