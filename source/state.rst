Managing State
==================

https://www.terraform.io/language/state

state is a file that contains a serialized representation of your infrastructure and configuration.

Backends determine where state is stored. For example, the local (default) backend stores state in a local JSON file on disk.

- local state 

默认情况下，Terraform会将状态保存在一个文件中，这个文件的名称是 ``terraform.tfstate``。

- remote state

Terraform writes the state data to a remote data store, which can then be shared between all members of a team.
Terraform supports storing state in:

- Terraform Cloud
- HashiCorp Consul
- Amazon S3
- Azure Blob Storage
- Google Cloud Storage
- Alibaba Cloud OSS
- and more

- lock

.. image:: _static/state_lock.jpg
   :alt: state_lock

.. toctree::
   :maxdepth: 2
   :caption: Contents:

   state/command
   state/s3