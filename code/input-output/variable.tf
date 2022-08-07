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

variable "enable_dns_hostnames" {

  type        = bool
  description = "enable dns hostname"
  default     = true
}

variable "volume_size" {
  type        = number
  description = "volume size in gibibytes"
  default     = 10
}

variable "aws_instance_sizes" {

  type        = map(string)
  description = "instance sizes"
  default = {

    small  = "t2.micro"
    medium = "t2.small"
    large  = "t2.large"
  }
}


variable "students" {
  type        = map(string)
  description = "student information"
  default = {
    name = "xxxx"
    age  = 20
  }
}