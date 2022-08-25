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

variable "vpc_cidr_block" {
  type = map(string)
  default = {
    private = "10.1.0.0/16"
    public  = "192.168.0.0/16"
  }

}

variable "users" {
  type = map(object({
    is_admin = bool
    name     = string
  }))
  default = {
    "admin" = {
      is_admin = true
      name     = "admin"
    }
    "user" = {
      is_admin = false
      name     = "user"
    }
  }
}