output "cloudfront_distribution_endpoint" {
  value = module.static_public_website.cloudfront_distribution_endpoint
}

output "bucket_object_storage_id" {
  value = module.object_storage.bucket_object_storage_id
}
