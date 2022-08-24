# # use count
# resource "aws_vpc" "vpc" {

#   count                = 2
#   cidr_block           = "10.${count.index}.0.0/16"
#   enable_dns_hostnames = var.enable_dns_hostnames
#   tags                 = {
#     Name = "terraform-vpc-${count.index}"
#   }

# }

resource "aws_vpc" "vpc2" {

  for_each = {
    private = "10.1.0.0/16"
    public  = "192.168.0.0/16"
  }
  cidr_block           = each.value
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = {
    Name = "terraform-vpc-${each.key}"
  }

}