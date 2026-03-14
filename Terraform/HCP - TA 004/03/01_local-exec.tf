resource "aws_instance" "ec2" {
  ami           = "ami-0b6c6ebed2801a5cb"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command    = "echo ${aws_instance.ec2.private_ip} >> private_ips.txt"
    on_failure = continue
  }

  provisioner "local-exec" {
    command = "echo This a destroy provisioner."
    when    = destroy
  }
}
