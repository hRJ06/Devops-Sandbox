provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "mumbai"
  region = "ap-south-1"
}

module "sg" {
  source = "./module/sg"
  providers = {
    aws.prod = aws.mumbai
  }
}
