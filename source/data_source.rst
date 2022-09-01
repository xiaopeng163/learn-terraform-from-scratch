Data sources
================

https://www.terraform.io/language/data-sources

Data sources allow Terraform to use information defined outside of Terraform, defined by another separate Terraform configuration, or modified by functions.

Resources are data sources

Providers have data sources

Alternative data sources

- Templates
- HTTP
- External
- Consul


Http data sources
-----------------------

https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http

.. code-block:: terraform

  data "http" "example" {
    url = "https://checkpoint-api.hashicorp.com/v1/check/terraform"

    # Optional request headers
    request_headers = {
      Accept = "application/json"
    }
  }
  resource "aws_vpc" "vpc" {
    cidr_block           = "10.0.0.0/16"
    enable_dns_hostnames = true
    tags = {
      Name = jsondecode(data.http.example.response_body)["product"]
    }
  }
