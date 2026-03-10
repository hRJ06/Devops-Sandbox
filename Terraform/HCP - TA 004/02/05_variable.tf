variable "tls_port" {
  type    = number
  default = 8080
}

variable "ssh_port" {
  type    = number
  default = 22
}

variable "ftp_port" {
  type    = number
  default = 21
}

variable "security_group_id" {
  type    = list(number)
  default = []
}

variable "types" {
  type = map(any)
  default = {
    us-east-1  = "t2.micro"
    us-west-2  = "t2.large"
    ap-south-1 = "t2.2xlarge"
  }
}

variable "user" {
  type    = list(string)
  default = ["Alice", "Bob", "John"]
}

variable "ami" {}


