output "bucket_static_website_endpoint" {
  value = resource.aws_s3_bucket.static_website_bucket.website_endpoint
}
