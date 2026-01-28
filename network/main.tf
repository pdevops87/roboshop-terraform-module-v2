resource "aws_security_group" "sg" {
  name = "allow-all"
  tags = {
    Name = "${var.env}-sg"
  }
}
resource "aws_vpc_security_group_ingress_rule" "ingress" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv6         = "0.0.0.0"
  from_port         = 0
  ip_protocol       = "-1"
  to_port           = 0
}

resource "aws_vpc_security_group_egress_rule" "egress" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 0
  ip_protocol       = "-1" # semantically equivalent to all ports
  to_port           = 0
}

