Consul
=========

download and install consul https://www.consul.io/downloads


Macos/Linux
----------------

.. code-block:: bash

    vagrant@ubuntu-focal:~$ curl -OL https://releases.hashicorp.com/consul/1.13.1/consul_1.13.1_linux_amd64.zip
    % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                    Dload  Upload   Total   Spent    Left  Speed
    100 43.5M  100 43.5M    0     0  18.9M      0  0:00:02  0:00:02 --:--:-- 18.9M
    vagrant@ubuntu-focal:~$ unzip consul_1.13.1_linux_amd64.zip
    Archive:  consul_1.13.1_linux_amd64.zip
    inflating: consul
    vagrant@ubuntu-focal:~$ sudo mv consul /usr/local/bin/
    vagrant@ubuntu-focal:~$ consul version
    Consul v1.13.1
    Revision c6d0f9ec
    Build Date 2022-08-11T19:07:00Z
    Protocol 2 spoken by default, understands 2 to 3 (agent will automatically use protocol >2 when speaking to compatible agents)

    vagrant@ubuntu-focal:~$
    vagrant@ubuntu-focal:~$ rm -rf consul_1.13.1_linux_amd64.zip


Prepare config
--------------------


.. code-block:: bash

    $ mkdir data
    vagrant@ubuntu-focal:~/github/learn-terraform-from-scratch/code/manage-state/consul$ ls
    config  data
    vagrant@ubuntu-focal:~/github/learn-terraform-from-scratch/code/manage-state/consul$ more config/consul-config.hcl
    ## server.hcl

    ui = true
    server = true
    bootstrap_expect = 1
    datacenter = "dc1"
    data_dir = "./data"

    acl = {
        enabled = true
        default_policy = "deny"
        enable_token_persistence = true

    }

Start consul instance locally
--------------------------------


.. code-block:: bash

    vagrant@ubuntu-focal:~/github/learn-terraform-from-scratch/code/manage-state/consul$ ls
    config  data
    vagrant@ubuntu-focal:~/github/learn-terraform-from-scratch/code/manage-state/consul$
    vagrant@ubuntu-focal:~/github/learn-terraform-from-scratch/code/manage-state/consul$ consul agent -bootstrap -config-file="config/consul-config.hcl" -bind="127.0.0.1"
    ==> Starting Consul agent...
            Version: '1.13.1'
            Build Date: '2022-08-11 19:07:00 +0000 UTC'
            Node ID: '7305b65b-098d-2998-e887-4652a4d016b9'
            Node name: 'ubuntu-focal'
            Datacenter: 'dc1' (Segment: '<all>')
                Server: true (Bootstrap: true)
        Client Addr: [127.0.0.1] (HTTP: 8500, HTTPS: -1, gRPC: -1, DNS: 8600)
        Cluster Addr: 127.0.0.1 (LAN: 8301, WAN: 8302)
            Encrypt: Gossip: false, TLS-Outgoing: false, TLS-Incoming: false, Auto-Encrypt-TLS: false

    ==> Log data will now stream in as it occurs:
    ......

consul将会在前台运行


Get Token
---------------


.. code-block:: bash

    $ consul acl bootstrap
    AccessorID:       0e9b5506-6855-d9a9-2c49-5b764b343b0b
    SecretID:         26efa357-2768-c72a-a120-0a38fefdf466
    Description:      Bootstrap Token (Global Management)
    Local:            false
    Create Time:      2022-08-31 14:29:50.179459862 +0000 UTC
    Policies:
    00000000-0000-0000-0000-000000000001 - global-management

设置环境变量

Linux and Mac

.. code-block:: bash
    $ export CONSUL_HTTP_TOKEN=26efa357-2768-c72a-a120-0a38fefdf466

Windows

.. code-block:: powershell

    $env:CONSUL_HTTP_TOKEN="26efa357-2768-c72a-a120-0a38fefdf466"


Terraform backend
--------------------

.. code-block:: terraform

    terraform {
    backend "consul" {
        address = "127.0.0.1:8500"
        scheme  = "http"
        path    = "test/terraform.tfstate"
    }
    }


查看state


.. code-block:: bash

    $ consul kv get test/terraform.tfstate