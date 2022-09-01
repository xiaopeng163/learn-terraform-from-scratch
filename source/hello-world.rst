Quick Start
==========================


What is Terraform
-------------------------

https://www.terraform.io/

- Infrastructure as code tool
- Open-source and vendor agnostic
- Single binary compiled from Go
- Declarative syntax
- in HCL(HashCorp Configuration Language) or JSON format
- Agentless (Push mode)

Terraform Core Components
----------------------------

- Terraform executable file
- Configuration files
- Provider plugins
- State data

Terraform Install
--------------------

- 下载可执行文件
- 添加PATH

https://www.terraform.io/downloads

以Windows为例：

.. code-block:: bash

    PS C:\> terraform
    Usage: terraform [global options] <subcommand> [args]

    The available commands for execution are listed below.
    The primary workflow commands are given first, followed by
    less common or more advanced commands.

    Main commands:
    init          Prepare your working directory for other commands
    validate      Check whether the configuration is valid
    plan          Show changes required by the current configuration
    apply         Create or update infrastructure
    destroy       Destroy previously-created infrastructure

    All other commands:
    console       Try Terraform expressions at an interactive command prompt
    fmt           Reformat your configuration in the standard style
    force-unlock  Release a stuck lock on the current workspace
    get           Install or upgrade remote Terraform modules
    graph         Generate a Graphviz graph of the steps in an operation
    import        Associate existing infrastructure with a Terraform resource
    login         Obtain and save credentials for a remote host
    logout        Remove locally-stored credentials for a remote host
    output        Show output values from your root module
    providers     Show the providers required for this configuration
    refresh       Update the state to match remote systems
    show          Show the current state or a saved plan
    state         Advanced state management
    taint         Mark a resource instance as not fully functional
    test          Experimental support for module integration testing
    untaint       Remove the 'tainted' state from a resource instance
    version       Show the current Terraform version
    workspace     Workspace management

    Global options (use these before the subcommand, if any):
    -chdir=DIR    Switch to a different working directory before executing the
                    given subcommand.
    -help         Show this help output, or the help for a specified subcommand.
    -version      An alias for the "version" subcommand.
    PS C:\> terraform version
    Terraform v1.2.6
    on windows_amd64
    PS C:\>

Terraform Object Types
-----------------------------

- Providers
- Resources
- Data sources


Terraform workflow
----------------------------

- terraform init
- terraform plan
- terraform apply
- terraform destroy


环境准备
-------------

准备AWS 账户以及access key和secret access key


创建第一个tf文件
-----------------

``main.tf``

.. code-block:: terraform

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
      access_key = "********************"
      secret_key = "********************"
      region     = "eu-central-1"
    }

    resource "aws_vpc" "vpc" {
      cidr_block           = "10.0.0.0/16"
      enable_dns_hostnames = "true"
      tags = {
        Name = "my-vpc"
      }
    }

terraform init
-------------------

.. code-block:: bash

    > terraform init

    Initializing the backend...

    Initializing provider plugins...
    - Finding hashicorp/aws versions matching "~> 4.16"...
    - Installing hashicorp/aws v4.24.0...
    - Installed hashicorp/aws v4.24.0 (signed by HashiCorp)

    Terraform has created a lock file .terraform.lock.hcl to record the provider
    selections it made above. Include this file in your version control repository
    so that Terraform can guarantee to make the same selections by default when
    you run "terraform init" in the future.

    Terraform has been successfully initialized!

    You may now begin working with Terraform. Try running "terraform plan" to see
    any changes that are required for your infrastructure. All Terraform commands
    should now work.

    If you ever set or change modules or backend configuration for Terraform,
    rerun this command to reinitialize your working directory. If you forget, other
    commands will detect it and remind you to do so if necessary.

terraform fmt & validate
--------------------------

.. code-block:: bash

    > terraform fmt
    > terraform validate
    Success! The configuration is valid.

terraform plan
----------------

.. code-block:: bash

    > terraform plan

    Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
      + create

    Terraform will perform the following actions:

      # aws_vpc.vpc will be created
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
              + "Name" = "my-vpc"
            }
          + tags_all                             = {
              + "Name" = "my-vpc"
            }
        }

    Plan: 1 to add, 0 to change, 0 to destroy.

    ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

    Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.


terraform apply
------------------

.. note::

   如果不想每次在apply或者destroy的时候提示输入yes，而是直接apply或则destroy，那么可以加参数 ``-auto-approve`` , 例如 ``terraform apply -auto-approve``
  
 
.. code-block:: bash

    > terraform apply
    Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
      + create

    Terraform will perform the following actions:

      # aws_vpc.vpc will be created
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
              + "Name" = "my-vpc"
            }
          + tags_all                             = {
              + "Name" = "my-vpc"
            }
        }

    Plan: 1 to add, 0 to change, 0 to destroy.

    Do you want to perform these actions?
      Terraform will perform the actions described above.
      Only 'yes' will be accepted to approve.

      Enter a value: yes

    aws_vpc.vpc: Creating...
    aws_vpc.vpc: Still creating... [10s elapsed]
    aws_vpc.vpc: Creation complete after 11s [id=vpc-0226b147ad3c83404]

    Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Inspect state
-------------------

.. code-block:: bash

    > terraform show
    # aws_vpc.vpc:
    resource "aws_vpc" "vpc" {
        arn                              = "arn:aws:ec2:eu-central-1:879589088447:vpc/vpc-0226b147ad3c83404"
        assign_generated_ipv6_cidr_block = false
        cidr_block                       = "10.0.0.0/16"
        default_network_acl_id           = "acl-08f8e3c4aca141247"
        default_route_table_id           = "rtb-0490c915e0bebf54d"
        default_security_group_id        = "sg-04aa1dce6a47ed020"
        dhcp_options_id                  = "dopt-f207cf9a"
        enable_classiclink               = false
        enable_classiclink_dns_support   = false
        enable_dns_hostnames             = true
        enable_dns_support               = true
        id                               = "vpc-0226b147ad3c83404"
        instance_tenancy                 = "default"
        ipv6_netmask_length              = 0
        main_route_table_id              = "rtb-0490c915e0bebf54d"
        owner_id                         = "879589088447"
        tags                             = {
            "Name" = "my-vpc"
        }
        tags_all                         = {
            "Name" = "my-vpc"
        }
    }
    > terraform state list
    aws_vpc.vpc

Update
-----------

update ``main.ft`` file, change the VPC tag name from ``my-vpc`` to ``my-vpc-demo``

then try to do a plan and apply

.. code-block:: bash

    > terraform plan
    aws_vpc.vpc: Refreshing state... [id=vpc-0226b147ad3c83404]

    Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
      ~ update in-place

    Terraform will perform the following actions:

      # aws_vpc.vpc will be updated in-place
      ~ resource "aws_vpc" "vpc" {
            id                               = "vpc-0226b147ad3c83404"
          ~ tags                             = {
              ~ "Name" = "my-vpc" -> "my-vpc-demo"
            }
          ~ tags_all                         = {
              ~ "Name" = "my-vpc" -> "my-vpc-demo"
            }
            # (15 unchanged attributes hidden)
        }

    Plan: 0 to add, 1 to change, 0 to destroy.

    ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

    Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
    > terraform apply
    aws_vpc.vpc: Refreshing state... [id=vpc-0226b147ad3c83404]

    Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
      ~ update in-place

    Terraform will perform the following actions:

      # aws_vpc.vpc will be updated in-place
      ~ resource "aws_vpc" "vpc" {
            id                               = "vpc-0226b147ad3c83404"
          ~ tags                             = {
              ~ "Name" = "my-vpc" -> "my-vpc-demo"
            }
          ~ tags_all                         = {
              ~ "Name" = "my-vpc" -> "my-vpc-demo"
            }
            # (15 unchanged attributes hidden)
        }

    Plan: 0 to add, 1 to change, 0 to destroy.

    Do you want to perform these actions?
      Terraform will perform the actions described above.
      Only 'yes' will be accepted to approve.

      Enter a value: yes

    aws_vpc.vpc: Modifying... [id=vpc-0226b147ad3c83404]
    aws_vpc.vpc: Modifications complete after 1s [id=vpc-0226b147ad3c83404]

    Apply complete! Resources: 0 added, 1 changed, 0 destroyed.

terraform destroy
--------------------

.. code-block:: bash

    > terraform destroy
    aws_vpc.vpc: Refreshing state... [id=vpc-0226b147ad3c83404]
    
    Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
      - destroy
    
    Terraform will perform the following actions:
    
      # aws_vpc.vpc will be destroyed
      - resource "aws_vpc" "vpc" {
          - arn                              = "arn:aws:ec2:eu-central-1:879589088447:vpc/vpc-0226b147ad3c83404" -> null
          - assign_generated_ipv6_cidr_block = false -> null
          - cidr_block                       = "10.0.0.0/16" -> null
          - default_network_acl_id           = "acl-08f8e3c4aca141247" -> null
          - default_route_table_id           = "rtb-0490c915e0bebf54d" -> null
          - default_security_group_id        = "sg-04aa1dce6a47ed020" -> null
          - dhcp_options_id                  = "dopt-f207cf9a" -> null
          - enable_classiclink               = false -> null
          - enable_classiclink_dns_support   = false -> null
          - enable_dns_hostnames             = true -> null
          - enable_dns_support               = true -> null
          - id                               = "vpc-0226b147ad3c83404" -> null
          - instance_tenancy                 = "default" -> null
          - ipv6_netmask_length              = 0 -> null
          - main_route_table_id              = "rtb-0490c915e0bebf54d" -> null
          - owner_id                         = "879589088447" -> null
          - tags                             = {
              - "Name" = "my-vpc-demo"
            } -> null
          - tags_all                         = {
              - "Name" = "my-vpc-demo"
            } -> null
        }
    
    Plan: 0 to add, 0 to change, 1 to destroy.
    
    Do you really want to destroy all resources?
      Terraform will destroy all your managed infrastructure, as shown above.
      There is no undo. Only 'yes' will be accepted to confirm.
    
      Enter a value: yes
    
    aws_vpc.vpc: Destroying... [id=vpc-0226b147ad3c83404]
    aws_vpc.vpc: Destruction complete after 1s
    
    Destroy complete! Resources: 1 destroyed.
