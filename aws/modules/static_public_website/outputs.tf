output "cloudfront_distribution_endpoint" {
  value = resource.aws_cloudfront_distribution.static_website_distribution.domain_name
}
