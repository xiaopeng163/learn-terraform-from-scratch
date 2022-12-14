Re-creation of Resources
==========================

当terraform创建的资源因某些原因出了问题，我们想重建这些资源，可以使用terraform taint命令，例如：

.. code-block:: bash

    terraform taint aws_instance.web

这个命令会将web实例标记为需要重建，然后执行terraform apply命令，terraform会重建web实例。

.. code-block:: bash

    terraform apply

资源重建后，terraform会将新的资源信息保存到state文件中，同时资源会被标记为untainted.


如果标记完taint后，反悔了，可以通过terraform untaint命令将资源的taint的标记去掉，例如：

.. code-block:: bash

    terraform untaint aws_instance.web
