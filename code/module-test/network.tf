module "my_vpc" {

  source = "./modules/vpc"
  
  aws_vpc_cidr_block = var.aws_vpc_cidr_block

}

output "vpc_id" {
  
  value = module.my_vpc.id

}

module "my_vpc_2" {

  source = "./modules/vpc"
  
  aws_vpc_cidr_block = "10.1.0.0/16"

}