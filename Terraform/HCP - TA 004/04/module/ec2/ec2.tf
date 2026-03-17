variable "ami" {}
variable "instance_type" {}
variable "region" {}

resource "aws_instance" "ec2" {
  ami           = var.ami
  instance_type = var.instance_type
}

output "instance_id" {
  value = aws_instance.ec2.id
}
