resource "tls_private_key" "ssh-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = tls_private_key.ssh-key.public_key_openssh

  # save private key to local disk, only works for linux/mac
  provisioner "local-exec" {
    command = "echo '${tls_private_key.ssh-key.private_key_pem}' > ./myKey.pem && chmod 400 ./myKey.pem"
  }
}
