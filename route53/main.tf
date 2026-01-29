resource "aws_route53_record" "record" {
  name    = "${var.components}-${var.env}"
  type    = var.type
  zone_id = var.zone_id
  records = [var.privateIP]
  ttl = 30
}