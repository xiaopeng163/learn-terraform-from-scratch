Output
========


Syntax
------------

.. code-block:: terraform

  output "name_label" {

    value = output_value
  
  }

.. code-block:: terraform

  output "vpc_id" {

    value = aws_vpc.vpc.id

  }

  resource "aws_vpc" "vpc" {
    cidr_block           = "10.0.0.0/16"
    enable_dns_hostnames = var.enable_dns_hostnames
    tags                 = local.common_tags
  }


Demo
------

output like 

.. code-block:: bash

  Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

  Outputs:

  vpc_id = "vpc-0e77125c45cdf65c4"

sensitive
-------------

.. note::

  如果不想讓output的值被顯示出來，可以使用sensitive = true，这样就不会在CLI中显示了，但是可以在Terraform state文件中中查看。

.. code-block:: terraform

  output "secret" {
    sensitive = true
    value     = "secret"
  }

https://www.terraform.io/language/values/outputs#sensitive-suppressing-values-in-cli-output