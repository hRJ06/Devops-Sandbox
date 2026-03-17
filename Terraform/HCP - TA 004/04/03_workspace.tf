locals {
  instance_type = {
    default = "t2.nano"
    dev     = "t2.micro"
    prod    = "t2.large"
  }
}
resource "aws_instance" "web" {
  ami           = "ami-0b6c6ebed2801a5cb"
  instance_type = local.instance_type[terraform.workspace]
}
