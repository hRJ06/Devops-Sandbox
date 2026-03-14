variable "user_name" {
  type    = set(string)
  default = ["Alice", "Bob", "John"]
}

resource "aws_iam_user" "this" {
  for_each = var.user_name
  name     = each.value
}

variable "ec2_map" {
  type = map(any)
  default = {
    "us-east-1" = "ami-08a0d1e16fc3f61ea"
    "us-west-2" = "ami-0b20a6f09484773af"
  }
}

resource "aws_instance" "for_each_web" {
  for_each      = var.ec2_map
  ami           = each.value
  instance_type = "t2.micro"

  tags = {
    Region = each.key
  }
}
