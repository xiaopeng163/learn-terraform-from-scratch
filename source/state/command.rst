State Command
===============

.. code-block:: bash


    terraform state list  # list objects in the state
    terraform state list -state=terraform.tfstate

    terraform state show # show the state detail about a specific object

    terraform state mv # move an object
    terraform state rm # remove an object
    terraform state pull -state=terraform.tfstate # pull from remote state
    terraform state push -state=terraform.tfstate # push to remote state
