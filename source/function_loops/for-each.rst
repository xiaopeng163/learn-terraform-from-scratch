for_each
================

https://www.terraform.io/language/meta-arguments/for_each

The for_each meta-argument accepts a map or a set of strings, and creates an instance for each item in that map or set.

Each instance has a distinct infrastructure object associated with it,
and each is separately created, updated, or destroyed when the configuration is applied.

In blocks where for_each is set, an additional each object is available in expressions, so you can modify the configuration of each instance. This object has two attributes:

- each.key — The map key (or set member) corresponding to this instance.
- each.value — The map value corresponding to this instance. (If a set was provided, this is the same as each.key.)


.. code-block:: terraform

    resource "aws_vpc" "vpc2" {

      for_each = {
        private = "10.1.0.0/16"
        public  = "192.168.0.0/16"
      }
      cidr_block           = each.value
      enable_dns_hostnames = var.enable_dns_hostnames
      tags = {
        Name = "terraform-vpc-${each.key}"
      }

    }

Terraform plan

.. code-block:: bash

    $ terraform plan

    Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
    following symbols:
      + create

    Terraform will perform the following actions:

      # aws_vpc.vpc2["private"] will be created
      + resource "aws_vpc" "vpc2" {
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
              + "Name" = "terraform-vpc-private"
            }
          + tags_all                             = {
              + "Name" = "terraform-vpc-private"
            }
        }

      # aws_vpc.vpc2["public"] will be created
      + resource "aws_vpc" "vpc2" {
          + arn                                  = (known after apply)
          + cidr_block                           = "192.168.0.0/16"
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
              + "Name" = "terraform-vpc-public"
            }
          + tags_all                             = {
              + "Name" = "terraform-vpc-public"
            }
        }

    Plan: 2 to add, 0 to change, 0 to destroy.

    ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

    Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run
    "terraform apply" now.