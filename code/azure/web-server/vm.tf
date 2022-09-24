resource "azurerm_linux_virtual_machine" "example" {
  name                = "example-machine"
  resource_group_name = azurerm_resource_group.terraform_demo.name
  location            = azurerm_resource_group.terraform_demo.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"

  disable_password_authentication = true

  admin_ssh_key {
    public_key = tls_private_key.ssh-key.public_key_openssh
    username   = "adminuser"
  }

  network_interface_ids = [
    azurerm_network_interface.my-vni.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

}
