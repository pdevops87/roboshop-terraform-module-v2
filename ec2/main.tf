resource "aws_instance" "instance" {
  name = var.component
  ami  = var.ami
  instance_type = var.instance_type
  security_groups = [var.vpc_sg]
}
resource "null_resource" "provisioner" {
   triggers = {
    timestamp = timestamp()
    instance_id = aws_instance.instance.id
  }
  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "ec2-user"
      password = "DevOps321"
      host     = aws_instance.instance.private_ip
    }
    inline = [
      "sudo dnf install python3.11-pip -y",
      "sudo pip3.11 install ansible",
      "ansible-pull -i localhost, -U https://github.com/pdevops87/roboshop-ansible-v4 roboshop.yaml -e component=${var.component} -e env=dev"
    ]
  }
}