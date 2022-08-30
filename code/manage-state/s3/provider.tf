terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "terraform-state-qaz"
    key    = "test/terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "terraform-lock-table"
  }
}
