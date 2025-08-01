module "dev-infrastructure" {
  source         = "./Infrastructure"
  env            = "dev"
  bucket_name    = "infrastructure-application-bucket"
  instance_count = 1
  instance_type  = "t2.micro"
  ec2-ami        = "ami-028727bd3039c5a1f"
  hash_key       = "ID"
}

module "prd-infrastructure" {
  source         = "./Infrastructure"
  env            = "prd"
  bucket_name    = "infrastructure-application-bucket"
  instance_count = 2
  instance_type  = "t2.medium"
  ec2-ami        = "ami-028727bd3039c5a1f"
  hash_key       = "ID"
}

module "stg-infrastructure" {
  source         = "./Infrastructure"
  env            = "stg"
  bucket_name    = "infrastructure-application-bucket"
  instance_count = 1
  instance_type  = "t2.small"
  ec2-ami        = "ami-028727bd3039c5a1f"
  hash_key       = "ID"
}
