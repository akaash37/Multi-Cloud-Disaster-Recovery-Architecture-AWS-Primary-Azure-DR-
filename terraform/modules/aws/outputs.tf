output "vpc_id" {
  value = aws_vpc.this.id
}
output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}
output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}
output "security_group_id" {
  value = aws_security_group.web_sg.id
}
output "key_pair_name" {
  value = aws_key_pair.this.key_name
}
output "tools_instance_id" {
  value = aws_instance.tools.id
}

output "tools_public_ip" {
  value = aws_instance.tools.public_ip
}
output "app_instance_id" {
  value = aws_instance.app.id
}

output "app_public_ip" {
  value = aws_instance.app.public_ip
}
