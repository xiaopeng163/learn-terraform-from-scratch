AWS Command Line Interface
=================================



Install
-----------

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html


Configure
----------------

.. code-block:: bash


    $ aws configure
    AWS Access Key ID [None]: ****************
    AWS Secret Access Key [None]: ************6**********lz91IDAm+2k
    Default region name [None]: eu-central-1
    Default output format [None]: json
    $ 
    $ 
    $ ls ~/.aws/
    config  credentials
    $ more ~/.aws/config 
    [default]
    region = eu-central-1
    output = json
    $ more ~/.aws/credentials 
    [default]
    aws_access_key_id = ****************
    aws_secret_access_key = ************6**********lz91IDAm+2k
    $ 