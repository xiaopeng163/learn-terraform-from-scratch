# use count
resource "aws_vpc" "vpc" {

  count                = 2
  cidr_block           = "10.${count.index}.0.0/16"
  enable_dns_hostnames = var.enable_dns_hostnames
  tags                 = {
    Name = "terraform-vpc-${count.index}"
  }

}
