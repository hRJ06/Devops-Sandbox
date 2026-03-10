resource "aws_iam_user" "user" {
  name  = var.user[count.index]
  count = 3
  tags = local.default
}
