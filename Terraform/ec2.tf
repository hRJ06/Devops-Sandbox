# CREATE KEY PAIR
resource "aws_key_pair" "ec2_deployer" {
  key_name = "ec2_deployer"
  public_key = file("id_ed25519.pub")
}

# USE DEFAULT VPC
resource "aws_default_vpc" "default_vpc" {
  
}

# CREATE SECURITY GROUP
resource "aws_security_group" "ec2_allow_user_to_connect" {
  name = "ec2-sg"
  description = "Allow inbound / outbound traffic"
  vpc_id = aws_default_vpc.default_vpc.id
  # INBOUND PORT
  ingress {
    description = "Allow PORT 22"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow PORT 80"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow PORT 443"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # OUTBOUND PORT
  egress {
    description = "Allow all outgoing traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Allow SSH inbound / outbound traffic"
  }
}

resource "aws_instance" "ec2_instance" {
    # count = 2 
    for_each = tomap({
      Hindol-EC2-t2-micro = "t2.micro"
      Hindol-EC2-t2-medium = "t2.medium"
    })
    depends_on = [ aws_security_group.ec2_allow_user_to_connect, aws_key_pair.ec2_deployer ]
    ami = var.ec2-ami
    # instance_type = "t2.micro"
    instance_type = each.value
    key_name = aws_key_pair.ec2_deployer.key_name
    security_groups = [aws_security_group.ec2_allow_user_to_connect.name]
    user_data = file("script.sh")
    root_block_device {
      volume_size = var.env == "dev" ? var.ec2-root-storage-size : 20
      volume_type = var.ec2-root-storage-type
    }
    tags = {
      # Name = "Hindol-EC2"
      Name = each.key
    }
}

