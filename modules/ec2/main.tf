data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_key_pair" "bastion" {
  key_name   = "bastion-key"
  public_key = file("ssh_key_bastion.pub")
}

resource "aws_key_pair" "private_ec2" {
  key_name   = "private-ec2-key"
  public_key = file("ssh_key_ec2.pub")
}

resource "aws_instance" "nginx_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.instance_type
  key_name = aws_key_pair.private_ec2.key_name
  subnet_id       = var.private_subnet
  security_groups = [var.security_gr]
  user_data       = file("userdata.tpl")

  tags = {
    Name = "nginx-ec2-${var.random_pet}"
  }
}
resource "aws_instance" "bastion_host" {
  ami             = data.aws_ami.ubuntu.id
  key_name = aws_key_pair.bastion.key_name
  instance_type   = var.instance_type
  subnet_id       = var.public_subnet
  security_groups = [var.security_gr]

  tags = {
    Name = "bastion-host-${var.random_pet}"
  }
}