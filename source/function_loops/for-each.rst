for_each
================

https://www.terraform.io/language/meta-arguments/for_each

The for_each meta-argument accepts a map or a set of strings,
and creates an instance for each item in that map or set.
Each instance has a distinct infrastructure object associated with it,
and each is separately created, updated, or destroyed when the configuration is applied.

In blocks where for_each is set, an additional each object is available in expressions, so you can modify the configuration of each instance. This object has two attributes:

- each.key — The map key (or set member) corresponding to this instance.
- each.value — The map value corresponding to this instance. (If a set was provided, this is the same as each.key.)


