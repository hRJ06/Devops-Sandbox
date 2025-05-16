variable "aws_region" {
  description = "This is the AWS region where the resources will be provisioned"
  default = "eu-west-1"
}

variable "s3-bucket-name" {
  description = "This is the name of the S3 bucket"
  default = "hindol-terraform-s3-bucket"
}

variable "ec2-instance-name" {
  description = "This is the name of the EC2 instance"
  default = "hindol-terraform-ec2-instance"
}

variable "ec2-ami" {
  description = "This is the AMI ID for the EC2 instance"
  default = "ami-0df368112825f8d8f"
}

variable "ec2-root-storage-type" {
  description = "This is the type for the EC2 root storage"
  default = "gp3"
}