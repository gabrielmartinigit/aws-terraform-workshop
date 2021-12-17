output "cloudfront_distribution_endpoint" {
  value = module.static_public_website.cloudfront_distribution_endpoint
}

output "cloudfront_distribution_endpoint_storage" {
  value = module.object_storage.cloudfront_distribution_endpoint_storage
}
