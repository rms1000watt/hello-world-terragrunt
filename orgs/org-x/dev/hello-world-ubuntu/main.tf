// variable "org_name" {}
variable "aws_region" {}
// variable "environment" {}

provider "aws" {
  region = "${var.aws_region}"
}

terraform {
  backend "s3" {}
}
