resource "aws_vpc_security_group_ingress_rule" "ing-rule" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "${aws_eip.lb-eip.public_ip}/32"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}

