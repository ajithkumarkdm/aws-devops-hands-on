resource "aws_instance" "master" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.master_instance_type

  subnet_id = aws_subnet.public_subnet[1].id

  vpc_security_group_ids = [
    aws_security_group.bastion_sg.id
  ]

  key_name                    = var.aws_ec2_key_pair_name
  associate_public_ip_address = true

  user_data = <<-EOF
    #!/bin/bash
    hostnamectl set-hostname ${var.master_hostname}
  EOF

  tags = {
    Name = var.master_hostname
  }
}