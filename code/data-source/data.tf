# Declare the data source
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones
data "aws_availability_zones" "available" {
  state = "available"
}

output "availability_zones" {
  value = data.aws_availability_zones.available.names
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami.html

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

#https://www.terraform.io/language/state/remote-state-data

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "terraform-state-qaz"
    key    = "test/terraform.tfstate"
    region = "eu-central-1"
  }
}

output "vpc_id" {
  value = data.terraform_remote_state.vpc.outputs.vpc_id
}
