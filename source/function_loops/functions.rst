Functions
===============

https://www.terraform.io/language/functions


``func_name(arg1, arg2, ...)``

Common Functions
--------------------

- Numeric:  min(42, 13, 7)
- String:  lower("TEST")
-  Collection:  merge(map1, map2)
- IP Network:  cidrsubnet()
- File system:  file(path)
- Type Conversion: toset()


Examples
--------------

try terraform functions with terraform console

.. code-block:: bash

    $ terraform console
    > min(12, 23, 1, 30)
    1
    > lower("TEST")
    "test"
    >
    > var.vpc_cidr_block
    tomap({
    "private" = "10.1.0.0/16"
    "public" = "192.168.0.0/16"
    })
    > lookup(var.vpc_cidr_block, "public")
    "192.168.0.0/16"
    > lookup(var.vpc_cidr_block, "public1")
    ╷
    │ Error: Error in function call
    │
    │   on <console-input> line 1:
    │   (source code not available)
    │
    │ Call to function "lookup" failed: lookup failed to find key "public1".
    ╵


    > lookup(var.vpc_cidr_block, "public1", "unknow")
    "unknow"
    >
    > merge(var.vpc_cidr_block, {"public1": "1.1.1.1/32"})
    {
    "private" = "10.1.0.0/16"
    "public" = "192.168.0.0/16"
    "public1" = "1.1.1.1/32"
    }


file and templatefile

.. code-block:: bash

    $ terraform console
    > file("${path.module}/main.tf")
    <<EOT
    # # use count
    # resource "aws_vpc" "vpc" {

    #   count                = 2
    #   cidr_block           = "10.${count.index}.0.0/16"
    #   enable_dns_hostnames = var.enable_dns_hostnames
    #   tags                 = {
    #     Name = "terraform-vpc-${count.index}"
    #   }
    # }

    # # Create a Subnet
    # output "vpc_id" {
    #   value = aws_vpc.vpc[0].id
    # }
    resource "aws_vpc" "vpc2" {

    for_each             = var.vpc_cidr_block
    cidr_block           = each.value
    enable_dns_hostnames = var.enable_dns_hostnames
    tags = {
        Name = "terraform-vpc-${each.key}"
    }

    }

    EOT
    >

.. code-block:: bash

    > file("${path.module}/test.tpl")
    "hello world ${name}"
    >

    > templatefile("test.tpl", {"name": "terraform"})
    "hello world terraform"
    >