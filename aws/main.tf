################################################################################
#### Módulo para criar CloudFront + Bucket S3 para website estático público ####
################################################################################
module "static_public_website" {
  source = "./modules/static_public_website"

  app_name    = "martinig-terraform-static-test"
  environment = var.environment
}

#################################################################
#### Módulo para criar Bucket para armazenamento de arquivos ####
#################################################################
module "object_storage" {
  source = "./modules/object_storage"

  app_name    = "martinig-terraform-static-test"
  environment = var.environment
}
