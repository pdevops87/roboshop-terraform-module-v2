module "ec2"{
  source = "./ec2"
  component = var.component
  ami = var.ami
  instance_type = var.instance_type
  vpc_sg = module.network.sg
}

module "network"{
  source = "./network"
  env = var.env
}


module "route53"{
  source = "./route53"
  components = module.ec2.components
  type = "A"
  zone_id = var.zone_id
  privateIP = module.ec2.private_ip
}
