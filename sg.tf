resource "aws_security_group" "vpn" {
  name        = format("vpn-%s-external", var.environment)
  description = "Terraform Managed. Allow traffic from internet."
  vpc_id      = var.vpc_id

  tags = {
    Name       = format("vpn-%s-external", var.environment)
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  ingress {
    from_port   = var.wg_access_server_listening_udp_port
    to_port     = var.wg_access_server_listening_udp_port
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}