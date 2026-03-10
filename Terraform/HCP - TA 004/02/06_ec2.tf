resource "aws_instance" "ec2" {
  ami                    = var.ami
  instance_type          = var.types["us-east-1"]
  vpc_security_group_ids = var.security_group_id
}

resource "aws_instance" "app_server" {
  ami           = lookup(var.ami_type, var.region)
  instance_type = lookup(var.types, var.region)
  count         = length(var.tags)

  tags = {
    Name = element(var.tags, count.index)
    CreationDate = formatdate("YYYY-MM-DD", timestamp())
  }
}
