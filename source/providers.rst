Providers
==============

https://registry.terraform.io/browse/providers

Public and private registries

- Official
- Verified
- Community

版本控制(重要考点之一)
-----------------------

https://www.terraform.io/language/expressions/version-constraints#version-constraint-syntax


The following operators are valid:

- ``= (or no operator)`` : Allows only one exact version number. Cannot be combined with other conditions.

- ``!=`` : Excludes an exact version number.

- ``>, >=, <, <=`` : Comparisons against a specified version, allowing versions for which the comparison is true. "Greater-than" requests newer versions, and "less-than" requests older versions.

- ``~>`` : Allows only the rightmost version component to increment. For example, to allow new patch releases within a specific minor release, use the full version number: ~> 1.0.4 will allow installation of 1.0.5 and 1.0.10 but not 1.1.0. This is usually called the pessimistic constraint operator.