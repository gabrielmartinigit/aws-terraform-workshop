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

  tags = {
    Resource             = "Test Bucket"
    git_commit           = "ca09a2262cb29bcd16e5071ca4abcabdceb30a2e"
    git_file             = "dia2/lab2/modules/public_static_website/main.tf"
    git_last_modified_at = "2022-01-27 06:21:57"
    git_last_modified_by = "gabrielb.martini@gmail.com"
    git_modifiers        = "gabrielb.martini"
    git_org              = "gabrielmartinigit"
    git_repo             = "aws-terraform-workshop"
    yor_trace            = "4769a8d3-b9ab-491b-9800-d55deb293dd0"
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
