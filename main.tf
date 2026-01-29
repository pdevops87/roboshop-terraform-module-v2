module "ec2"{
  depends_on = [module.network]
  source = "./ec2"
  for_each = var.components
  component = each.key
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

  source = "./route53"
  components = var.components
  type = "A"
  zone_id = var.zone_id
  privateIP = module.ec2.ip
  env=var.env
}

module "ansible"{
  depends_on = [module.route53]
  source="./ansible"
  component = var.components
  env = var.env
  privateIP = module.ec2.ip
}


