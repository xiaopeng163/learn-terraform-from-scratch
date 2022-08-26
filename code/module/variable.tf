variable "aws_regions" {
  type    = list(string)
  default = ["eu-central-1", "us-east-1", "us-east-2"]
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
