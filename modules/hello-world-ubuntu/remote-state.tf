variable "aws_profile" {}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config {
    key     = "${var.environment}/vpc/terraform.tfstate"
    bucket  = "org-x-global-terraform-state"
    region  = "${var.aws_region}"
    profile = "${var.aws_profile}"
  }
}
