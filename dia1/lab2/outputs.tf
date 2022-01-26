#################
#### Outputs ####
#################
output "aws_s3_website_endpoint" {
  value = aws_s3_bucket.static_website_bucket.website_endpoint
}