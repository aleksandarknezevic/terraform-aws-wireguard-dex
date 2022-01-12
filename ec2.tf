data "aws_ami" "ami" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "instance" {
  ami                         = coalesce(var.ec2_ami_id, data.aws_ami.ami.image_id)
  instance_type               = var.ec2_instance_type
  key_name                    = var.ssh_key_name
  security_groups             = [aws_security_group.vpn.name]
  associate_public_ip_address = true

  user_data_base64 = data.template_cloudinit_config.config.rendered

  tags = {
    Name = format("vpn-dex-%s", var.environment)
  }

  root_block_device {
    volume_size = var.volume_size
  }
}

resource "aws_eip" "wg_dex" {
  instance = aws_instance.instance.id
  vpc      = true
}