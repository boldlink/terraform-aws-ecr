## Description

This Module Provides a Public Elastic Container Registry Repository.

[NOTE:] This resource can only be used with us-east-1 region.

Example available [here](https://github.com/boldlink/terraform-aws-ecr-public/tree/main/examples)

## Documentation

[AWS ecr-public documentation](https://docs.aws.amazon.com/AmazonECR/latest/public/public-repository-create.html)

[Terraform provider documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecrpublic_repository)


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.12.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecrpublic_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecrpublic_repository) | resource |
| [aws_ecrpublic_repository_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecrpublic_repository_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_catalog_data"></a> [catalog\_data](#input\_catalog\_data) | (Optional) Catalog data configuration for the repository. | `any` | `[]` | no |
| <a name="input_create_ecrpublic_repository_policy"></a> [create\_ecrpublic\_repository\_policy](#input\_create\_ecrpublic\_repository\_policy) | whether to create ecr public repository policy or not | `bool` | `false` | no |
| <a name="input_create_public_repository"></a> [create\_public\_repository](#input\_create\_public\_repository) | Whether to create a public repository or not. | `bool` | `false` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | (Required) The policy document. This is a JSON formatted string. | `string` | `""` | no |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | (Required) Name of the repository. | `string` | n/a | yes |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts) | aws\_ecrpublic\_repository provides the following Timeouts configuration options:delete | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Full ARN of the repository. |
| <a name="output_id"></a> [id](#output\_id) | The repository name. |
| <a name="output_registry_id"></a> [registry\_id](#output\_registry\_id) | The registry ID where the repository was created. |
| <a name="output_repository_uri"></a> [repository\_uri](#output\_repository\_uri) | The URI of the repository. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
