Functions
===============

https://www.terraform.io/language/functions


Common Functions
--------------------

Numeric:  min(42, 13, 7)

String:  lower("TEST")

Collection:  merge(map1, map2)

IP Network:  cidrsubnet()

File system:  file(path)

Type Conversion: toset()


Examples
--------------

try terraform functions with terraform console

.. code-block:: bash

    > terraform console
    > min(12, 23, 1, 30)
    1
    > lower("TEST")
    "test"
    >
