## Description

This module creates an Elastic Container Registry Repository.

Example available [here](https://github.com/boldlink/terraform-aws-ecr/tree/main/examples)
## Documentation

[AWS ecr documentation](https://docs.aws.amazon.com/AmazonECR/latest/userguide/what-is-ecr.html)

[Terraform provider documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecr_lifecycle_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_ecr_lifecycle_policy"></a> [aws\_ecr\_lifecycle\_policy](#input\_aws\_ecr\_lifecycle\_policy) | (Required) The policy document. This is a JSON formatted string.. | `string` | n/a | yes |
| <a name="input_aws_ecr_repository_policy"></a> [aws\_ecr\_repository\_policy](#input\_aws\_ecr\_repository\_policy) | (Required) The policy document. This is a JSON formatted string. | `string` | n/a | yes |
| <a name="input_create_aws_ecr_lifecycle_policy"></a> [create\_aws\_ecr\_lifecycle\_policy](#input\_create\_aws\_ecr\_lifecycle\_policy) | Create the lifecyle policy? True or false | `bool` | `true` | no |
| <a name="input_create_aws_ecr_repository_policy"></a> [create\_aws\_ecr\_repository\_policy](#input\_create\_aws\_ecr\_repository\_policy) | Create the ecr repository policy? True or false | `bool` | `true` | no |
| <a name="input_encryption_configuration"></a> [encryption\_configuration](#input\_encryption\_configuration) | (Optional) Encryption configuration for the repository. | <pre>object({<br>    encryption_type = string<br>    kms_key         = any<br>  })</pre> | <pre>{<br>  "encryption_type": null,<br>  "kms_key": null<br>}</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment tag, e.g prod, test | `string` | `null` | no |
| <a name="input_image_tag_mutability"></a> [image\_tag\_mutability](#input\_image\_tag\_mutability) | (Optional) The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE. Defaults to MUTABLE. | `string` | `"MUTABLE"` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Name of the repository. | `string` | n/a | yes |
| <a name="input_other_tags"></a> [other\_tags](#input\_other\_tags) | Any additional values for tags | `map(string)` | `{}` | no |
| <a name="input_scan_on_push"></a> [scan\_on\_push](#input\_scan\_on\_push) | (Required) Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false). | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Full ARN of the repository. |
| <a name="output_registry_id"></a> [registry\_id](#output\_registry\_id) | The registry ID where the repository was created. |
| <a name="output_repository_url"></a> [repository\_url](#output\_repository\_url) | The URL of the repository (in the form aws\_account\_id.dkr.ecr.region.amazonaws.com/repositoryName). |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
