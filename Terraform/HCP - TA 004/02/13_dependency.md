# Implicit Dependency

```sh
resource "aws_security_group" "allow_tls" {
  name = "TF - Firewall"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = var.tls_port
  to_port           = var.tls_port
  ip_protocol       = "tcp"
}
```

# Explicit Dependency

```sh
resource "aws_instance" "ec2" {
  ami           = "ami-0b6c6ebed2801a5cb"
  instance_type = "t2.micro"
  depends_on    = [aws_s3_bucket.s3_bucket]
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "hR-Bucket"
}
```