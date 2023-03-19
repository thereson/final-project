resource "tls_private_key" "keypair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "deployer" {
  key_name   = "ubuntu"
  public_key = tls_private_key.keypair.public_key_openssh
}

resource "local_file" "ssh_key" {
  content         = tls_private_key.keypair.private_key_pem
  filename        = "ubuntu.pem"
  file_permission = "400"
}
