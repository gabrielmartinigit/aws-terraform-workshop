# AWS Terraform Workshop

## Dia 01

- **Agenda:**
  - Conceitos sobre IaC
  - Introdução ao Terraform
  - Acessando a conta para os labs
  - Lab 1, Lab 2 , Lab 3
  - Desafio

_Comandos que podem auxiliar:_

```
// Comandos básicos do Terraform
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy

// Upload de arquivo para o bucket S3
aws s3 cp ../utils/index.html s3://NOME_DO_SEU_BUCKET/index.html
```

## Dia 02

- **Agenda:**
  - Organização do repositório
  - CI/CD para IaC
  - Lab 1, Lab 2, Lab 3
  - Desafio
  - Estudos e próximos passos (flexibilidade, custos, testes, segurança, livros, etc.)

_Ferramentas utilizadas:_

- Yor: https://github.com/bridgecrewio/yor
- Infracost: https://github.com/infracost/infracost
- Terratest: https://github.com/gruntwork-io/terratest
- Atlantis: https://github.com/runatlantis/atlantis
- Terrascan: https://github.com/accurics/terrascan

## Referências

- Terraform commands: https://www.terraform.io/cli/commands
- Terraform AWS Provider Registry: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
- Terraform code structure: https://www.terraform-best-practices.com/code-structure
- Terraform module structure: https://www.terraform.io/language/modules/develop/structure
- Remote backend for AWS: https://www.terraform.io/language/settings/backends/s3
- Terraform automation: https://learn.hashicorp.com/tutorials/terraform/automate-terraform?in=terraform/automation
- Awesome Terraform: https://github.com/shuaibiyy/awesome-terraform
