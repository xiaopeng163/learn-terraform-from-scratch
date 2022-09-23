import
=======

有时候我们想把一个已经存在的resource，但并没有被terraform管理的，纳入到terraform中来管理，这时候就需要用到import命令。


文档 https://www.terraform.io/cli/commands/import

import命令的格式如下：

.. code-block:: bash

    terraform import [options] ADDR ID

其中ADDR是resource的地址，ID是resource的ID，比如一个aws_instance的ID就是instance的ID，一个aws_security_group的ID就是security group的ID。


Demo
-------

我们在aws上创建一个VPC，然后用terraform import把它纳入到terraform的管理中来, 通过aws的web console可以看到这个VPC的ID，比如
 ``vpc-0af5cb081c28cf2e3``

新建一个文件夹，比如 ``import_demo``，然后在这个文件夹下新建一个 ``main.tf`` 文件，内容如下：

.. code-block:: hcl

    provider "aws" {
      region = "us-east-1"
    }

    # create vpc
    resource "aws_vpc" "my-vpc" {

      cidr_block           = "10.0.0.0/16"
      enable_dns_hostnames = true
      tags                 = {
        Name = "my-vpc"
      }
    }

.. code-block:: bash

    $ terraform import aws_vpc.my-vpc vpc-0af5cb081c28cf2e3
    aws_vpc.my-vpc: Importing from ID "vpc-0af5cb081c28cf2e3"...
    aws_vpc.my-vpc: Import prepared!
      Prepared aws_vpc for import
    aws_vpc.my-vpc: Refreshing state... [id=vpc-0af5cb081c28cf2e3]

    Import successful!

    The resources that were imported are shown above. These resources are now in
    your Terraform state and will henceforth be managed by Terraform.