resource "aws_instance" "ec2" {
  ami                    = var.ami
  instance_type          = var.types["us-east-1"]
  vpc_security_group_ids = var.security_group_id
}
