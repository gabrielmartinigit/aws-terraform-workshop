output "cloudfront_distribution_endpoint_storage" {
  value = resource.aws_cloudfront_distribution.storage_distribution.domain_name
}