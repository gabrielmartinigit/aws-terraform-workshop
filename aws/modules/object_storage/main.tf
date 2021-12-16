########################################
#### Recurso para criar o bucket S3 ####
########################################
resource "aws_s3_bucket" "object_storage_bucket" {
  bucket = "${var.app_name}-objects"
  acl    = "private"

  tags = {
    Name        = "${var.app_name}-objects"
    Environment = var.environment
  }
}


############################################################################
#### Recurso para bloquear políticas e acls que deixam o bucket público ####
############################################################################
resource "aws_s3_bucket_public_access_block" "s3_private" {
  bucket                  = aws_s3_bucket.object_storage_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}
