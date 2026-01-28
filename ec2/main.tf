resource "aws_instance" "instance" {
  name = var.component
  ami  = var.ami
  instance_type = var.instance_type
  security_groups = [var.vpc_sg]
}