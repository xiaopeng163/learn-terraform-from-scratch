Azure with Terraform
=======================

Azure command line interface
-----------------------------

Install the Azure command line interface (CLI) on your machine. You can find the instructions here: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest

Azure CLI is a command line tool that allows you to manage Azure resources. It is available for Windows, Linux, and macOS. You can use it to create and manage Azure resources from the command line. You can also use it to create and manage Azure resources from scripts.

Authenticating with Azure CLI
-----------------------------

https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/azure_cli

.. code-block:: bash

    az login

This will open a browser window and ask you to login to your Azure account. After you login, you will be asked to select the Azure subscription you want to use.


Authenticating using a Service Principal with a Client Secret
----------------------------------------------------------------

https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret


Creating a Service Principal using the Azure CLI
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

首先先 az login 登录。拿到 subscription id

.. code-block:: bash

    az account show

创建一个 service principal

.. code-block:: bash

    az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<SUBSCRIPTION_ID>"

这个命令会返回一个 json，里面包含了 client_id, client_secret, tenant_id， 其中：

- ``appId`` 就是 ``client_id``
- ``password`` 就是 ``client_secret``
- ``tenant`` 就是 ``tenant_id`` 

再加上我们的 subscription id，就可以在 terraform 中使用了。设置环境变量如下：

.. code-block:: bash

    $ export ARM_CLIENT_ID="00000000-0000-0000-0000-000000000000"
    $ export ARM_CLIENT_SECRET="00000000-0000-0000-0000-000000000000"
    $ export ARM_SUBSCRIPTION_ID="00000000-0000-0000-0000-000000000000"
    $ export ARM_TENANT_ID="00000000-0000-0000-0000-000000000000"



Creating a Service Principal in the Azure Portal
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret#creating-a-service-principal-in-the-azure-portal

