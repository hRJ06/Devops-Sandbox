resource "aws_key_pair" "ec2_key" {
  key_name   = "ec2-key"
  public_key = file("ec2-key.pub")
}

resource "aws_security_group" "ec2_sg" {
  name        = "ec2_sg"
  description = "Allow Inbound / Outbound traffic."

  ingress {
    description = "Allow PORT 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow PORT 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outgoing traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "web" {
  ami             = "ami-0b6c6ebed2801a5cb"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.ec2_sg.name]
  key_name        = aws_key_pair.ec2_key.key_name

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("ec2-key.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  }
}
