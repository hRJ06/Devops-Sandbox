resource "aws_security_group" "allow_tls_dynamic" {
  name = "TF - Firewall"

  dynamic "ingress" {
    for_each = var.firewall_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      cidr_blocks = ["0.0.0.0/0"]
      protocol    = "tcp"
    }
  }
}
