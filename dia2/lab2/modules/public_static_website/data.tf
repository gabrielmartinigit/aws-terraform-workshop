data "aws_iam_policy_document" "public_read" {
  statement {
    actions = [
      "s3:GetObject"
    ]
    principals {
      identifiers = ["*"]
      type        = "AWS"
    }
    resources = [
      "${aws_s3_bucket.static_website_bucket.arn}/*"
    ]
  }
}
