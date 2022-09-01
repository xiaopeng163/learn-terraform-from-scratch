AWS Command Line Interface
=================================

Install
-----------

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html


Configure
----------------

.. code-block:: bash


    $ aws configure
    AWS Access Key ID [None]: ****************
    AWS Secret Access Key [None]: ************6**********lz91IDAm+2k
    Default region name [None]: eu-central-1
    Default output format [None]: json
    $ 
    $ 
    $ ls ~/.aws/
    config  credentials
    $ more ~/.aws/config 
    [default]
    region = eu-central-1
    output = json
    $ more ~/.aws/credentials 
    [default]
    aws_access_key_id = ****************
    aws_secret_access_key = ************6**********lz91IDAm+2k
    $ 

aws_cli for terraform
-------------------------

实际上如果已经通过aws cli配置了，那么可以直接使用aws cli，不需要配置terraform里的aws provider。

.. code-block:: bash

  $ aws configure list
        Name                    Value             Type    Location
        ----                    -----             ----    --------
     profile                <not set>             None    None
  access_key     ****************B4XB shared-credentials-file    
  secret_key     ****************m+2k shared-credentials-file    
      region             eu-central-1      config-file    ~/.aws/config

也就是下面的 ``provider "aws"`` 可以删掉了。

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
      access_key = "xxxxxxxxxxxxxxx"
      secret_key = "xxxxxxxxxxxxxx"
      region     = "eu-central-1"
    }

    resource "aws_vpc" "vpc" {
      cidr_block           = "10.0.0.0/16"
      enable_dns_hostnames = true
      tags = {
        Name = "my-vpc"
      }
    }