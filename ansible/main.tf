resource "null_resource" "provisioner" {
  triggers = {
    timestamp = timestamp()
    instance_id = var.instanceId
  }
  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "ec2-user"
      password = "DevOps321"
      host     = var.privateIP
    }
    inline = [
      "sudo dnf install python3.11-pip -y",
      "sudo pip3.11 install ansible",
      "ansible-pull -i localhost, -U https://github.com/pdevops87/roboshop-ansible-v4 roboshop.yaml -e component=${var.component} -e env=${var.env}"
    ]
  }
}



