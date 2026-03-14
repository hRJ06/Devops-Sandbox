resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.types["us-east-1"]

  tags = {
    Name = "TF-Tag"
  }

  lifecycle {
    ignore_changes  = [tags, instance_type]
    prevent_destroy = true
  }
}


resource "aws_instance" "app" {
  ami           = var.ami
  instance_type = var.types["us-east-1"]

  tags = {
    Name = "TF-Tag"
  }

  lifecycle {
    create_before_destroy = true
  }
}
