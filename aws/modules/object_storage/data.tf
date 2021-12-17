data "aws_iam_policy_document" "s3_object_storage_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.object_storage_bucket.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.oai_object_storage_s3.iam_arn]
    }
  }
}
