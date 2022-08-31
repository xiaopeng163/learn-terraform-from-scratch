Data sources
================

https://www.terraform.io/language/data-sources

Data sources allow Terraform to use information defined outside of Terraform, defined by another separate Terraform configuration, or modified by functions.

Resources are data sources

Providers have data sources

Alternative data sources

- Templates
- HTTP
- External
- Consul


Http data sources
-----------------------

.. code-block:: terraform

    data "http" "my_http" {
      url = "http://www.example.com"
    }

use the response

    ${data.http.my_http.body}


Consul data source
-----------------------

.. code-block:: terraform

    data "consul" "my_consul" {
      key = {
        name = "my_key"
        path = "my/path"
        default = "my_default"
      }
    }


use the response

    ${data.consul.my_consul.var.my_key}
