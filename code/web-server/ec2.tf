# Create a EC2 Instance (Ubuntu 2204)
resource "aws_instance" "node" {
  instance_type          = var.instance_type
  ami                    = var.ami_ubuntu
  key_name               = aws_key_pair.deployer.id
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  subnet_id              = aws_subnet.my_subnet.id

  tags = {
    Name = "TF Generated EC2"
  }

  root_block_device {
    volume_size = 10
  }

  user_data = file("${path.module}/setup.sh")
}

# Create and assosiate an Elastic IP
resource "aws_eip" "eip" {
  instance = aws_instance.node.id
}

output "ec2_public_ip" {

  value = aws_eip.eip.public_ip
}
