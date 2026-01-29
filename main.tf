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
  for_each = var.components
  source = "./route53"
  components = each.key
  type = "A"
  zone_id = var.zone_id
  privateIP = module.ec2[each.key].ip.private_ip
  env=var.env
}


