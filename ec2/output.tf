output "components" {
  value = var.component
}
output "private_ip" {
  value = aws_instance.instance.private_ip
}

output "instance"{
  value = aws_instance.instance.id
}
