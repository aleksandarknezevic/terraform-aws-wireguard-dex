output "public_ip" {
  value = aws_eip.wg_dex.public_ip
}

output "private_ip" {
  value = aws_instance.instance.private_ip
}

output "ec2_instance_id" {
  value = aws_instance.instance.id
}

output "security_group_id" {
  value = aws_security_group.vpn.id
}