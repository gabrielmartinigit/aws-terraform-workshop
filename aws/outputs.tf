output "bucket_static_website_endpoint" {
  value = module.static_public_website.bucket_static_website_endpoint
}

output "bucket_object_storage_id" {
  value = module.object_storage.bucket_object_storage_id
}
