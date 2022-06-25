# Complete AWS KMS Example

Configuration in this directory creates:

- <XXX>

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which will incur monetary charges on your AWS bill. Run `terraform destroy` when you no longer need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kms_complete"></a> [kms\_complete](#module\_kms\_complete) | ../.. | n/a |
| <a name="module_kms_default"></a> [kms\_default](#module\_kms\_default) | ../.. | n/a |
| <a name="module_kms_disabled"></a> [kms\_disabled](#module\_kms\_disabled) | ../.. | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_complete_aliases"></a> [complete\_aliases](#output\_complete\_aliases) | A map of aliases created and their attributes |
| <a name="output_complete_grants"></a> [complete\_grants](#output\_complete\_grants) | A map of grants created and their attributes |
| <a name="output_complete_key_arn"></a> [complete\_key\_arn](#output\_complete\_key\_arn) | The Amazon Resource Name (ARN) of the key |
| <a name="output_complete_key_id"></a> [complete\_key\_id](#output\_complete\_key\_id) | The globally unique identifier for the key |
| <a name="output_complete_key_policy"></a> [complete\_key\_policy](#output\_complete\_key\_policy) | The IAM resource policy set on the key |
| <a name="output_default_aliases"></a> [default\_aliases](#output\_default\_aliases) | A map of aliases created and their attributes |
| <a name="output_default_grants"></a> [default\_grants](#output\_default\_grants) | A map of grants created and their attributes |
| <a name="output_default_key_arn"></a> [default\_key\_arn](#output\_default\_key\_arn) | The Amazon Resource Name (ARN) of the key |
| <a name="output_default_key_id"></a> [default\_key\_id](#output\_default\_key\_id) | The globally unique identifier for the key |
| <a name="output_default_key_policy"></a> [default\_key\_policy](#output\_default\_key\_policy) | The IAM resource policy set on the key |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

Apache-2.0 Licensed. See [LICENSE](https://github.com/clowdhaus/terraform-aws-kms/blob/main/LICENSE).
