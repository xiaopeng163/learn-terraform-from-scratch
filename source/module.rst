Module
==========

What is a module?
-------------------

Module可以理解成Python里的library或者模块，主要是为了代码重用和防止重新造轮子。

Module可以是本地的，也可以是远程的。

- 远程module可以在https://registry.terraform.io/browse/modules 查看下载
- 远程module会在引用时，通过terraform init下载到本地。
- 远程module需要指定版本


Structure
-----------

和“函数”类似，输入->函数体->输出。

- input
- resources
- output


.. image:: _static/module-scope.jpg
   :width: 600
   :alt: module

