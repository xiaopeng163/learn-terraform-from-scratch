Terraform Cloud
======================

Terraform Cloud is a SaaS offering that provides a web UI for Terraform, as well as a remote backend for Terraform state. It also provides a way to share Terraform configurations and run Terraform in a team setting.


Migrate state to Terraform Cloud
-----------------------------------


准备工作
~~~~~~~~~~~~~~~~


1. 准备terraform cloud账号
2. 从Terraform Cloud中获取一个API token （https://app.terraform.io/app/settings/tokens）
3. 创建一个organization（https://app.terraform.io/app/organizations/new）
4. 在创建的organization中创建一个workspace

源码 ``code/manage-state/cloud``


backend设置

.. code-block:: terraform
    
        terraform {
        backend "remote" {
            organization = "my-org"
    
            workspaces {
            name = "my-app"
            }
        }
        }

