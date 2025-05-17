resource "aws_s3_bucket" "remote_s3" {
    bucket = "hindol-state-bucket"
    tags = {
      Name = "hindol-state-bucket"
    }
  
}