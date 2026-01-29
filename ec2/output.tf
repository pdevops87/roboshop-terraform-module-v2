output "components" {
  value = var.component
}
output "ip" {
  value = aws_instance.instance.private_ip
}


