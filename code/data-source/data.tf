# Declare the data source
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones
data "aws_availability_zones" "available" {
  state = "available"
}

output "availability_zones" {
  value = data.aws_availability_zones.available.names
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

output "ami" {
  value = data.aws_ami.ubuntu.id
}

# #https://www.terraform.io/language/state/remote-state-data
# data "terraform_remote_state" "vpc" {
#   backend = "consul"
#   config = {
#     address = "127.0.0.1:8500"
#     scheme  = "http"
#     path    = "test/terraform.tfstate"
#   }
# }

# output "vpc_id" {
#   value = data.terraform_remote_state.vpc.outputs.vpc_id
# }

# read data from consul
# https://registry.terraform.io/providers/hashicorp/consul/latest/docs
# data "consul_keys" "test" {

#   key {
#     name    = "cidr"
#     path    = "test/terraform"
#     default = ""
#   }
# }

# resource "aws_vpc" "vpc" {
#   cidr_block           = jsondecode(data.consul_keys.test.var.cidr)["cidr"]
#   enable_dns_hostnames = true
#   tags = {
#     Name = "my-vpc"
#   }
# }

data "template_file" "tmp" {
  template = file("${path.module}/data/test.json")
  vars = {
    cidr_block = var.cidr_block
  }
}

output "tmp" {
  value = jsondecode(data.template_file.tmp.rendered)
}