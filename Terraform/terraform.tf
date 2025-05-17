terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "hindol-state-bucket"
    key = "terraform.tfstate"
    region = "eu-west-1"
    dynamodb_table = "Hindol-state-table"
  }
}