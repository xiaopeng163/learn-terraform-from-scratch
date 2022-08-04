Locals
========

https://www.terraform.io/language/values/locals


Syntax
-------------

.. code-block:: terraform

    locals {
      # Common tags to be assigned to all resources
      common_tags = {
        Company = "example.com"
        Owner   = "test"
      }
    }


How to Use locals
------------------------

.. code-block:: terraform

    resource "aws_vpc" "vpc" {
      cidr_block           = "10.0.0.0/16"
      enable_dns_hostnames = var.enable_dns_hostnames
      tags = local.common_tags
    }