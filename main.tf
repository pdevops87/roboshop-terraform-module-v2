module "ec2"{
  depends_on = [module.network]
  source = "./ec2"
  component = var.component
  ami = var.ami
  instance_type = var.instance_type
  vpc_sg = module.network.sg
  env=var.env
}

module "network"{
  source = "./network"
  env = var.env
}


module "route53"{
  depends_on = [module.ec2]
  source = "./route53"
  components = module.ec2.components
  type = "A"
  zone_id = var.zone_id
  privateIP = module.ec2.private_ip
}
