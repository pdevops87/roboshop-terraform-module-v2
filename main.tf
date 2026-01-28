module "ec2"{
  for_each = var.components
  depends_on = [module.network]
  source = "./ec2"
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
  for_each = var.components
  depends_on = [module.ec2]
  source = "./route53"
  components = module.ec2[each.key].components
  type = "A"
  zone_id = var.zone_id
  privateIP = module.ec2[each.key].private_ip
}
