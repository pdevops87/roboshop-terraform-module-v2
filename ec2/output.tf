output "components" {
  value = var.component
}
output "ip" {
  value = aws_instance.instance
}

output "instance"{
  value = aws_instance.instance.id
}
