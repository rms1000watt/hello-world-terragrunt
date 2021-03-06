resource "aws_s3_bucket" "images" {
  bucket   = "${var.org_name}-${var.environment}-images"
  acl      = "private"

  versioning {
    enabled = true
  }

  logging {
    target_bucket = "${aws_s3_bucket.logs.id}"
    target_prefix = "log/"
  }

  lifecycle_rule {
    enabled = true

    noncurrent_version_expiration {
      days = 30
    }
  }
}
