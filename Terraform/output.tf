# COUNT 
/* output "ec2_public_ip" {
  value = aws_instance.ec2_instance[*].public_ip
}

output "ec2_public_dns" {
  value = aws_instance.ec2_instance[*].public_dns
} */

# FOR EACH
output "ec2_public_ip" {
  value = [
    for instance in aws_instance.ec2_instance : instance.public_ip
  ]
}

output "ec2_public_dns" {
  value = [
    for instance in aws_instance.ec2_instance : instance.public_dns
  ]
}