resource "aws_s3_bucket" "logs" {
  bucket   = "${var.org_name}-${var.environment}-logs"
  acl      = "log-delivery-write"

  lifecycle_rule {
    id      = "log"
    enabled = true

    prefix  = "log/"
    tags {
      rule      = "log"
      autoclean = "true"
    }

    expiration {
      days = 30
    }
  }
}
