output "public_ip" {
  value = aws_eip.wg_dex.address
}

output "ec2_instance_id" {
  value = aws_instance.instance.id
}

output "security_group_id" {
  value = aws_security_group.vpn.id
}