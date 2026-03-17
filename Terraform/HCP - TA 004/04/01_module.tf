module "ec2" {
  source        = "./module/ec2"
  ami           = "ami-0b6c6ebed2801a5cb"
  instance_type = "t2.micro"
  region        = "us-east-1"
}

resource "aws_eip" "eip" {
  instance = module.ec2.instance_id
}
