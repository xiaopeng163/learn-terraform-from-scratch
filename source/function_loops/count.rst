Count
============


Syntax
-------------

.. code-block:: terraform

    resource "aws_vpc" "vpc" {

      count                = 2
      cidr_block           = "10.${count.index}.0.0/16"
      enable_dns_hostnames = var.enable_dns_hostnames
      tags                 = {
        Name = "terraform-vpc-${count.index}"
      }
    }

terraform plan

.. code-block:: bash

    > terraform plan

    Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
      + create

    Terraform will perform the following actions:

      # aws_vpc.vpc[0] will be created
      + resource "aws_vpc" "vpc" {
          + arn                                  = (known after apply)
          + cidr_block                           = "10.0.0.0/16"
          + default_network_acl_id               = (known after apply)
          + default_route_table_id               = (known after apply)
          + default_security_group_id            = (known after apply)
          + dhcp_options_id                      = (known after apply)
          + enable_classiclink                   = (known after apply)
          + enable_classiclink_dns_support       = (known after apply)
          + enable_dns_hostnames                 = true
          + enable_dns_support                   = true
          + id                                   = (known after apply)
          + instance_tenancy                     = "default"
          + ipv6_association_id                  = (known after apply)
          + ipv6_cidr_block                      = (known after apply)
          + ipv6_cidr_block_network_border_group = (known after apply)
          + main_route_table_id                  = (known after apply)
          + owner_id                             = (known after apply)
          + tags                                 = {
              + "Company" = "example.com"
              + "Owner"   = "test"
            }
          + tags_all                             = {
              + "Company" = "example.com"
              + "Owner"   = "test"
            }
        }

      # aws_vpc.vpc[1] will be created
      + resource "aws_vpc" "vpc" {
          + arn                                  = (known after apply)
          + cidr_block                           = "10.1.0.0/16"
          + default_network_acl_id               = (known after apply)
          + default_route_table_id               = (known after apply)
          + default_security_group_id            = (known after apply)
          + dhcp_options_id                      = (known after apply)
          + enable_classiclink                   = (known after apply)
          + enable_classiclink_dns_support       = (known after apply)
          + enable_dns_hostnames                 = true
          + enable_dns_support                   = true
          + id                                   = (known after apply)
          + instance_tenancy                     = "default"
          + ipv6_association_id                  = (known after apply)
          + ipv6_cidr_block                      = (known after apply)
          + ipv6_cidr_block_network_border_group = (known after apply)
          + main_route_table_id                  = (known after apply)
          + owner_id                             = (known after apply)
          + tags                                 = {
              + "Company" = "example.com"
              + "Owner"   = "test"
            }
          + tags_all                             = {
              + "Company" = "example.com"
              + "Owner"   = "test"
            }
        }

    Plan: 2 to add, 0 to change, 0 to destroy.

    ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

    Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.


Count References
---------------------

<resource_type>.<name_label>[index].<attribute>


``aws_vpc.vpc[0].id``

``aws_vpc.vpc[*].id``   # all instance

for example

.. code-block:: terraform

    output "vpc_id" {
    
      value = aws_vpc.vpc[*].id

    }

output:

.. code-block:: bash

    Changes to Outputs:
      + vpc_id = [
          + (known after apply),
          + (known after apply),
        ]
