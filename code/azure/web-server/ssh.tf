resource "tls_private_key" "ssh-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


resource "azurerm_ssh_public_key" "deployer" {
  name                = "deployer-key"
  resource_group_name = azurerm_resource_group.terraform_demo.name
  location            = azurerm_resource_group.terraform_demo.location
  public_key          = tls_private_key.ssh-key.public_key_openssh

  # # save private key to local disk, only works for linux/mac
  # provisioner "local-exec" {
  #   command = "echo '${tls_private_key.ssh-key.private_key_pem}' > ./myKey.pem && chmod 400 ./myKey.pem"
  # }
  # # delete private key from local disk when execute terraform destroy, only works for linux/mac
  # provisioner "local-exec" {
  #   command = "rm -rf ./myKey.pem"
  #   when    = destroy
  # }
}
