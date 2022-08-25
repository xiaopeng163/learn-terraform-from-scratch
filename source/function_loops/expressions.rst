Expressions
=================

- for
- condition


for Expressions
----------------

.. code-block:: bash

    > var.aws_regions
    tolist([
    "eu-central-1",
    "us-east-1",
    "us-east-2",
    ])
    > [for v in var.aws_regions: upper(v)]
    [
    "EU-CENTRAL-1",
    "US-EAST-1",
    "US-EAST-2",
    ]
    > {for s in var.aws_regions : s => upper(s)}
    {
    "eu-central-1" = "EU-CENTRAL-1"
    "us-east-1" = "US-EAST-1"
    "us-east-2" = "US-EAST-2"
    }
    >
    >
    > [for i, v in var.aws_regions : "${i} is ${v}"]
    [
    "0 is eu-central-1",
    "1 is us-east-1",
    "2 is us-east-2",
    ]
    >

Condition
---------

定义一个variable

.. code-block:: terraform

    variable "users" {
      type = map(object({
        is_admin = bool
        name     = string
      }))
      default = {
        "admin" = {
          is_admin = true
          name     = "admin"
        }
        "user" = {
          is_admin = false
          name     = "user"
        }
      }
    }

    locals {
      admin_users = {
        for name, user in var.users : name => user
        if user.is_admin
      }
      regular_users = {
        for name, user in var.users : name => user
        if !user.is_admin
      }
    }

.. code-block:: bash

    > var.users
    tomap({
      "admin" = {
        "is_admin" = true
        "name" = "admin"
      }
      "user" = {
        "is_admin" = false
        "name" = "user"
      }
    })
    > local.admin_users
    {
      "admin" = {
        "is_admin" = true
        "name" = "admin"
      }
    }
    > local.regular_users
    {
      "user" = {
        "is_admin" = false
        "name" = "user"
      }
    }
    >