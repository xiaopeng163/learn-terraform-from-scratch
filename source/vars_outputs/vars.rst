Variables
=================

https://www.terraform.io/language/values/variables

Variable Syntax
--------------------

.. code-block:: terraform


    variable "name_label" {
      
      type = string

      description = "value"

      default = "value"

      sensitive = true

    }

to reference the variable ``var.<name_label>``

Data Types
----------------

Primitive
~~~~~~~~~~~~

- String
- number
- boolean

Collections
~~~~~~~~~~~~~~

- List
- set
- map


.. code-block:: terraform

    variable "aws_regions" {
    
      type = list(string)
      
      description = "Region to use for AWS"
      
      default = ["us-east-1", "us-east-2", "us-west-1", "us-west-2"]

    }

to reference collection values:

var.<name_labe>[<index>]

var.aws_regions[0]  is us-east-1

.. code-block:: terraform

    variable "aws_instance_sizes" {

      type        = map(string)
      description = "instance sizes"
      default = {

        small  = "t2.micro"
        medium = "t2.small"
        large  = "t2.large"
      }
    }

to reference var.<name_label>.<key_name> or var.<name_label>["key_name"]

- var.aws_instance_sizes.small
- var.aws_instance_sizes["small"]


Structural
~~~~~~~~~~~~~~~

- Tuple
- object


Supply variable values
------------------------------

- default value
- -var flag
- -var-file flag
- tf var files

    - terraform.tfvars
    - terraform.tfvars.json
    - .auto.tfvars
    - .auto.tfvars.json
- Environment variable TF_VAR_

.. image:: ../_static/tf-var-evaluation.PNG
   :alt: tf-vars



Demo
------

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

    variable "aws_region" {
      type    = string
      default = "eu-central-1"
    }

    variable "aws_access_key" {

      type        = string
      description = "aws access key"
      sensitive   = true
    }

    variable "aws_secret_key" {

      type        = string
      description = "aws secret key"
      sensitive   = true
    }

    variable "enable_dns_hostnames" {

      type        = bool
      description = "enable dns hostname"
      default     = true
    }


    provider "aws" {
      access_key = var.aws_access_key
      secret_key = var.aws_secret_key
      region     = var.aws_region
    }

    resource "aws_vpc" "vpc" {
      cidr_block           = "10.0.0.0/16"
      enable_dns_hostnames = var.enable_dns_hostnames
      tags = {
        Name = "my-vpc-demo"
      }
    }

use -var
~~~~~~~~~~~~

.. code-block:: bash

    terraform plan -var=aws_access_key="xxxxxxxxx" -var=aws_secret_key="xxxxxxxx"

use Environment vars
~~~~~~~~~~~~~~~~~~~~~~~

for Linux and Mac

.. code-block:: bash

    export TF_VAR_aws_access_key=xxxxxxxxxxxxxxxx
    export TF_VAR_aws_secret_key=xxxxxxxxxxxxxxxx

for windows powershell

.. code-block:: powershell

    $env:TF_VAR_aws_access_key="xxxxxxxxxxxxxxxx"
    $env:TF_VAR_aws_secret_key="xxxxxxxxxxxxxxxx"

use tfvars files
~~~~~~~~~~~~~~~~~~

create a file ``terraform.tfvars``

.. code-block:: terraform

    aws_access_key="xxxxxxxxxxxxxxxx"
    aws_secret_key="xxxxxxxxxxxxxxxx"
