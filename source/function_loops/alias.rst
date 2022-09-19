alias: Multiple Provider Configurations
-------------------------------------------

https://www.terraform.io/language/providers/configuration#alias-multiple-provider-configurations


在provider里我们可以指定provider的相关配置，但是如果有多个provider怎么办，比如我们要在不同的region里创建资源，这时候就需要用到alias了，
 ``alias`` 可以让我们在一个provider里配置多个不同的provider，比如下面的例子：

.. code-block:: terraform

    provider "aws" {
      region = "us-east-1"
    }

    provider "aws" {
      alias  = "us-west-2"
      region = "us-west-2"
    }

    resource "aws_vpc" "vpc1" {
      provider = aws.us-west-2
      cidr_block           = "10.1.0.0/16"
      enable_dns_hostnames = true
      tags                 = {
        Name = "terraform-vpc1"
      }
    }

    resource "aws_vpc" "vpc2" {

      cidr_block           = "10.0.0.0/16"
      enable_dns_hostnames = true
      tags                 = {
        Name = "terraform-vpc2"
      }
    }

比如以上，我们只想在us-west-2里创建资源vpc1，我们就可以在resource里指定provider为 ``aws.us-west-2``，这样就可以在us-west-2里创建资源了。

vpc2并没有指定provider，所以默认使用的是第一个provider，也就是us-east-1。