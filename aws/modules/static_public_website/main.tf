###################################################################
#### Recurso para criar o bucket S3 com propriedade de website ####
###################################################################
resource "aws_s3_bucket" "static_website_bucket" {
  bucket = var.app_name
  acl    = "private"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = {
    Name        = var.app_name
    Environment = var.environment
  }
}

############################################################################
#### Recurso para bloquear políticas e acls que deixam o bucket público ####
############################################################################
resource "aws_s3_bucket_public_access_block" "s3_private" {
  bucket                  = aws_s3_bucket.static_website_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}

########################################################################
#### Política para permitir acesso de leitura somente ao CloudFront ####
########################################################################
resource "aws_s3_bucket_policy" "allow_access_from_cloudfront" {
  bucket = aws_s3_bucket.static_website_bucket.id
  policy = data.aws_iam_policy_document.s3_website_policy.json
}

##########################################################################
#### Identificador OAI do CloudFront para adicionar na política do S3 ####
##########################################################################
resource "aws_cloudfront_origin_access_identity" "oai_website_s3" {
  comment = "OAI to access S3 website bucket"
}

#################################################################
#### Distribuição do CloudFront para origem do website no S3 ####
#################################################################
resource "aws_cloudfront_distribution" "static_website_distribution" {
  origin {
    domain_name = aws_s3_bucket.static_website_bucket.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.static_website_bucket.id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai_website_s3.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Static public website CDN distribution"
  default_root_object = "index.html"

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = aws_s3_bucket.static_website_bucket.id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Name        = var.app_name
    Environment = var.environment
  }
}
