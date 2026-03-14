variable "region" {
  default = "us-east-1"
}

variable "tags" {
  type    = list(string)
  default = ["EC2-1", "EC-2"]
}

variable "firewall_ports" {
  type    = list(number)
  default = [8080, 22, 21]
}

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


variable "ami_type" {
  type = map(any)
  default = {
    "us-east-1"  = "ami-08a0d1e16fc3f61ea"
    "us-west-2"  = "ami-0b20a6f09484773af"
    "ap-south-1" = "ami-0e1d06225679bc1c5"
  }
}

variable "my_set" {
  type    = set(string)
  default = ["hello", "world", "hello"]
}

variable "my_object" {
  type = object({
    Name   = string
    userId = number
  })
  default = {
    Name   = "Hindol"
    userId = 1
  }
}


variable "password" {
  type = string
  validation {
    condition     = length(var.password) >= 12
    error_message = "Length of password must be atleast 12 characters."
  }
}


variable "instance_type" {
  type = string
}
