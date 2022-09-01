terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
    http = {
      source = "hashicorp/http"
      version = "3.1.0"
    }
  }

  required_version = ">= 1.2.0"
}


# provider "aws" {
#   access_key = "xxxxxxxxxxxxxxx"
#   secret_key = "xxxxxxxxxxxxxx"
#   region     = "eu-central-1"
# }

resource "aws_vpc" "vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = jsondecode(data.http.example.response_body)["product"]
  }
}

data "http" "example" {
  url = "https://checkpoint-api.hashicorp.com/v1/check/terraform"

  # Optional request headers
  request_headers = {
    Accept = "application/json"
  }
}
