State Command
===============

.. code-block:: bash

    $ terraform state
    Usage: terraform [global options] state <subcommand> [options] [args]

    This command has subcommands for advanced state management.

    These subcommands can be used to slice and dice the Terraform state.
    This is sometimes necessary in advanced cases. For your safety, all
    state management commands that modify the state create a timestamped
    backup of the state prior to making modifications.

    The structure and output of the commands is specifically tailored to work
    well with the common Unix utilities such as grep, awk, etc. We recommend
    using those tools to perform more advanced state tasks.

    Subcommands:
        list                List resources in the state
        mv                  Move an item in the state
        pull                Pull current state and output to stdout
        push                Update remote state from a local state file
        replace-provider    Replace provider in the state
        rm                  Remove instances from the state
        show                Show a resource in the state


.. code-block:: bash

    $ terraform state list
    aws_vpc.vpc
    $ terraform state show aws_vpc.vpc
    # aws_vpc.vpc:
    resource "aws_vpc" "vpc" {
        arn                              = "arn:aws:ec2:eu-central-1:879589088447:vpc/vpc-0c872fe63a2a3a244"
        assign_generated_ipv6_cidr_block = false
        cidr_block                       = "10.0.0.0/16"
        default_network_acl_id           = "acl-06189d002ed790bcc"
        default_route_table_id           = "rtb-0b01d11a6ae442915"
        default_security_group_id        = "sg-04179c7d9dae848f1"
        dhcp_options_id                  = "dopt-f207cf9a"
        enable_classiclink               = false
        enable_classiclink_dns_support   = false
        enable_dns_hostnames             = true
        enable_dns_support               = true
        id                               = "vpc-0c872fe63a2a3a244"
        instance_tenancy                 = "default"
        ipv6_netmask_length              = 0
        main_route_table_id              = "rtb-0b01d11a6ae442915"
        owner_id                         = "879589088447"
        tags                             = {
            "Name" = "terraform-vpc"
        }
        tags_all                         = {
            "Name" = "terraform-vpc"
        }
    }
