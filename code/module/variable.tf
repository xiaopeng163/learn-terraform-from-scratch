variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "aws_availability_zones" {
  type    = list(string)
  default = ["eu-central-1a"]
}

variable "aws_vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "aws_vpc_name" {
  type    = string
  default = "my-vpc"
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

variable "ami_ubuntu" {
  type        = string
  description = "ami ubuntu"
  default     = "ami-065deacbcaac64cf2"
}

variable "instance_type" {
  type        = string
  description = "instance type"
  default     = "t2.micro"
}

variable "aws_sg_ingress_rules" {
  type = list(map(string))
  default = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

}

variable "aws_sg_egress_rules" {
  type = list(map(string))
  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = -1
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}