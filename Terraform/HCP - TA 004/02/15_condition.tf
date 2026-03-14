resource "aws_instance" "web_app" {
  instance_type = var.instance_type
  ami           = var.ami

  lifecycle {
    precondition {
      condition = data.aws_ec2_instance_type.instance_type_prop.free_tier_eligible
      error_message = "Instance type is not part of Free Tier."
    }
    postcondition {
      condition = self.public_ip != ""
      error_message = "Public IP is required."
    }
  }
}
