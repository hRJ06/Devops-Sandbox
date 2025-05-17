resource "aws_dynamodb_table" "dynamodb-state-table" {
  name           = "Hindol-state-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "Hindol-state-table"
  }
}