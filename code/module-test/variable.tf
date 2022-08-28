variable "aws_region" {
  type    = string
  default = "eu-central-1"
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

variable "aws_vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}