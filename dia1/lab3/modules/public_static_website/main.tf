###################################################################
#### Recurso para criar o bucket S3 com propriedade de website ####
###################################################################
resource "random_id" "id" {
  byte_length = 8
}

resource "aws_s3_bucket" "static_website_bucket" {
  bucket        = "${var.bucket_name}-${random_id.id.hex}"
  acl           = "public-read"
  force_destroy = true

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

#############################################
#### Policy para deixar o bucket público ####
#############################################
resource "aws_s3_bucket_public_access_block" "s3_private" {
  bucket                  = aws_s3_bucket.static_website_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  restrict_public_buckets = false
  ignore_public_acls      = false
}

resource "aws_s3_bucket_policy" "allow_public_access" {
  bucket = aws_s3_bucket.static_website_bucket.id
  policy = data.aws_iam_policy_document.public_read.json
}
