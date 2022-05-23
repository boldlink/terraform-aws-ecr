[![Build Status](https://github.com/boldlink/terraform-aws-ecr/actions/workflows/pre-commit.yml/badge.svg)](https://github.com/boldlink/terraform-aws-ecr/actions)

[<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>](https://boldlink.io)

## Description

This module creates an Elastic Container Registry Repository.

Example(s) available [here](https://github.com/boldlink/terraform-aws-ecr/tree/main/examples)

## Usage
*NOTE*: These examples use the latest version of this module

```console
module "private_ecr" {
  source                    = "./../../"
  create_private_repository = true
  name                      = "example-minimum"
}

```

## Documentation

[AWS ecr documentation](https://docs.aws.amazon.com/AmazonECR/latest/userguide/what-is-ecr.html)

[Terraform provider documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_private"></a> [private](#module\_private) | ./modules/private | n/a |
| <a name="module_public"></a> [public](#module\_public) | ./modules/public | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_ecr_lifecycle_policy"></a> [aws\_ecr\_lifecycle\_policy](#input\_aws\_ecr\_lifecycle\_policy) | (Required) The policy document. This is a JSON formatted string.. | `string` | `""` | no |
| <a name="input_aws_ecr_repository_policy"></a> [aws\_ecr\_repository\_policy](#input\_aws\_ecr\_repository\_policy) | (Required) The policy document. This is a JSON formatted string. | `string` | `""` | no |
| <a name="input_catalog_data"></a> [catalog\_data](#input\_catalog\_data) | (Optional) Catalog data configuration for the repository. | `any` | `[]` | no |
| <a name="input_create_ecrpublic_repository_policy"></a> [create\_ecrpublic\_repository\_policy](#input\_create\_ecrpublic\_repository\_policy) | whether to create ecr public repository policy or not | `bool` | `false` | no |
| <a name="input_create_private_repository"></a> [create\_private\_repository](#input\_create\_private\_repository) | Whether to create a private repository or not. | `bool` | `false` | no |
| <a name="input_create_public_repository"></a> [create\_public\_repository](#input\_create\_public\_repository) | Whether to create a public repository or not. | `bool` | `false` | no |
| <a name="input_encryption_configuration"></a> [encryption\_configuration](#input\_encryption\_configuration) | (Optional) Encryption configuration for the repository. | <pre>object({<br>    encryption_type = string<br>    kms_key         = any<br>  })</pre> | <pre>{<br>  "encryption_type": "KMS",<br>  "kms_key": null<br>}</pre> | no |
| <a name="input_image_tag_mutability"></a> [image\_tag\_mutability](#input\_image\_tag\_mutability) | (Optional) The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE. Defaults to MUTABLE. | `string` | `"IMMUTABLE"` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Name of the repository. | `string` | n/a | yes |
| <a name="input_other_tags"></a> [other\_tags](#input\_other\_tags) | Any additional values for tags | `map(string)` | `{}` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | (Required) The policy document. This is a JSON formatted string. | `string` | `""` | no |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts) | aws\_ecrpublic\_repository provides the following Timeouts configuration options:delete | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The repository name. |
| <a name="output_private_arn"></a> [private\_arn](#output\_private\_arn) | Full ARN of the repository. |
| <a name="output_private_registry_id"></a> [private\_registry\_id](#output\_private\_registry\_id) | The registry ID where the repository was created. |
| <a name="output_public_arn"></a> [public\_arn](#output\_public\_arn) | Full ARN of the repository. |
| <a name="output_public_registry_id"></a> [public\_registry\_id](#output\_public\_registry\_id) | The registry ID where the repository was created. |
| <a name="output_repository_uri"></a> [repository\_uri](#output\_repository\_uri) | The URI of the repository. |
| <a name="output_repository_url"></a> [repository\_url](#output\_repository\_url) | The URL of the repository (in the form aws\_account\_id.dkr.ecr.region.amazonaws.com/repositoryName). |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Third party software
This repository uses third party software:
* [pre-commit](https://pre-commit.com/) - Used to help ensure code and documentation consistency
  * Install with `brew install pre-commit`
  * Manually use with `pre-commit run`
* [terraform 0.14.11](https://releases.hashicorp.com/terraform/0.14.11/) For backwards compatibility we are using version 0.14.11 for testing making this the min version tested and without issues with terraform-docs.
* [terraform-docs](https://github.com/segmentio/terraform-docs) - Used to generate the [Inputs](#Inputs) and [Outputs](#Outputs) sections
  * Install with `brew install terraform-docs`
  * Manually use via pre-commit
* [tflint](https://github.com/terraform-linters/tflint) - Used to lint the Terraform code
  * Install with `brew install tflint`
  * Manually use via pre-commit

### Makefile
The makefile contain in this repo is optimized for linux paths and the main purpose is to execute testing for now.
* Create all tests:
`$ make tests`
* Clean all tests:
`$ make clean`

#### BOLDLink-SIG 2022
