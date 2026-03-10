locals {
  default = {
    Team         = "TF-Team"
    CreationDate = "date-${formatdate("YYYY-MM-DD", timestamp())}"
  }
}
