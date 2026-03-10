output "public-ip" {
  value = aws_eip.lb-eip.public_ip
}

output "public-url" {
  value = "https://${aws_eip.lb-eip.public_ip}:8080"
}

output "data" {
  value = data.local_file.user_data
}