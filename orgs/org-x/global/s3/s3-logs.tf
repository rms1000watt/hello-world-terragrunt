resource "aws_s3_bucket" "logs" {
  bucket   = "org-x-global-logs"
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
