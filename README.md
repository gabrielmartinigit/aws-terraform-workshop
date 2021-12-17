# AWS Terraform Samples

Samples to create basic and common AWS architecture patterns with Terraform

_Portuguese version: [README-PT](./README-PT.md)_

## Example Architecture

![architecture](images/sample-architecture.jpg)

## Folder Structure

![project](images/projects.jpg)

**TF Common Repository**

Modules are the main way to package and reuse resource configurations with Terraform. Modules are containers for multiple resources that are used together. A module consists of a collection of .tf files kept together in a directory.

Common repository has the objective to centralize common modules that SRE/DevOps team creates and undertands as best practices patterns and has the minimun requirements to be utilized as start point in new projects.

```
.
├── README.md //Documentation about the modules and how to import in project repositories
├── .gitignore
├── aws //Provider folder
│ ├── modules //Modules folder
│ │ ├── module_y //Generic module to be reutilized by projects
│ │ │ ├── data.tf //Data sources allow Terraform to use information defined outside of Terraform
│ │ │ ├── main.tf //Call modules, locals, and data sources to create all resources
│ │ │ ├── outputs.tf //Contains outputs from the resources created in main.tf
│ │ │ └── variables.tf //C8790ontains declarations of variables used in main.tf
│ │ └── module_z
│ │   ├── data.tf
│ │   ├── main.tf
│ │   ├── outputs.tf
│ │   └── variables.tf
└── architectures //Documentation of architectures utilized in modules
  ├── module_y_architecture.drawio
  ├── module_y_architecture.jpg
  ├── module_z_architecture.drawio
  └── module_z_architecture.jpg
```

**TF Project ABCD**

Project repository that is going to provision infrastructure for project applications. It is going to reutilize common modules from TF Common Repository as starting point but It is going to have your own variables, environments and also can have your own specifications and modules if necessary.

```

```

## Getting Started

### Manual Deploy

_Pre-requisites:_

- _AWS Account: https://aws.amazon.com/_
- _AWS Credentials for Terraform: https://console.aws.amazon.com/iam/home?#/security_credentials_
- _AWS CLI configured: https://aws.amazon.com/cli/_
- _Terraform CLI: https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started_

```
cd aws/

terraform init //Prepare your working directory for other commands

terraform fmt //Reformat your configuration in the standard style

terraform validate //Check whether the configuration is valid

terraform plan //Show changes required by the current configuration

terraform apply //Create or update infrastructure

```

### Pipeline/Release Deploy

_Pre-requisites:_

```

```

### Cleanup

```
cd aws/
terraform destroy //Destroy previously-created infrastructure
```

## Next Steps

- Empower developers to write Terraform: https://www.runatlantis.io/

## References

- Terraform commands: https://www.terraform.io/cli/commands
- Terraform AWS Provider Registry: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
- Terraform code structure: https://www.terraform-best-practices.com/code-structure
- Terraform module structure: https://www.terraform.io/language/modules/develop/structure
- Remote backend for AWS: https://www.terraform.io/language/settings/backends/s3
