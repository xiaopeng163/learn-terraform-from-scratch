# # use count
# resource "aws_vpc" "vpc" {

#   count                = 2
#   cidr_block           = "10.${count.index}.0.0/16"
#   enable_dns_hostnames = var.enable_dns_hostnames
#   tags                 = {
#     Name = "terraform-vpc-${count.index}"
#   }
# }

# # Create a Subnet
# output "vpc_id" {
#   value = aws_vpc.vpc[0].id
# }
resource "aws_vpc" "vpc2" {

  for_each             = var.vpc_cidr_block
  cidr_block           = each.value
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = {
    Name = "terraform-vpc-${each.key}"
  }

}

locals {
  admin_users = {
    for name, user in var.users : name => user
    if user.is_admin
  }
  regular_users = {
    for name, user in var.users : name => user
    if !user.is_admin
  }
}