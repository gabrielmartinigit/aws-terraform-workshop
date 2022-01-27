###############################
#### Provider do Terraform ####
###############################

terraform {
  backend "s3" {
    bucket = "martinig-terraform-estado"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn = "arn:aws:iam::SUA_CONTA:role/terraform-prod-role"
  }

  default_tags {
    tags = {
      Application   = "Workshop"
      TerraformRepo = "aws-terraform-workshop"
    }
  }
}
