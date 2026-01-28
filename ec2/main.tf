resource "aws_instance" "instance" {
  ami  = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [var.vpc_sg]
  tags = {
    Name = var.component
  }
}
