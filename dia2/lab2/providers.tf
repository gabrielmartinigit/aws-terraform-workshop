###############################
#### Provider do Terraform ####
###############################
provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"

  default_tags {
    tags = {
      Application   = "Workshop"
      TerraformRepo = "aws-terraform-workshop"
    }
  }
}
