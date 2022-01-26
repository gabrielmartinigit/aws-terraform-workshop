###############################
#### Provider do Terraform ####
###############################
provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "workshop"
}

###################################################################
#### Recurso para criar o bucket S3 com propriedade de website ####
###################################################################
resource "random_id" "id" {
  byte_length = 8
}

resource "aws_s3_bucket" "static_website_bucket" {
  bucket        = "workshop-terraform-${random_id.id.hex}"
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
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "PublicReadGetObject",
        "Effect" : "Allow",
        "Principal" : "*",
        "Action" : [
          "s3:GetObject"
        ],
        "Resource" : [
          "${aws_s3_bucket.static_website_bucket.arn}/*"
        ]
      }
    ]
  })
}

#################
#### Outputs ####
#################
output "aws_s3_website_endpoint" {
  value = aws_s3_bucket.static_website_bucket.website_endpoint
}
