data "local_file" "user_data" {
  filename = "${path.module}/foo.txt"
}

data "aws_ami" "ami_image" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

data "aws_ec2_instance_type" "instance_type_prop" {
  instance_type = var.instance_type
}


data "http" "url" {
  url = "https://google.com"
}