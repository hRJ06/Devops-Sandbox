/* resource "aws_instance" "ec2_old" {
  instance_type = var.instance_type
  ami           = var.ami
  tags = {
    Name = "TF-EC2"
  }
} */

resource "aws_instance" "ec2_new" {
  instance_type = var.instance_type
  ami           = var.ami
  tags = {
    Name = "TF-EC2"
  }
}

moved {
  from = aws_instance.ec2_old
  to   = aws_instance.ec2_new
}
