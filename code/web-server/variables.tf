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

variable "enable_dns_hostnames" {

  type        = bool
  description = "enable dns hostname"
  default     = true
}