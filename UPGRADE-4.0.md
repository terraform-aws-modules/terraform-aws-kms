# Upgrade from v3.x to v4.x

If you have any questions regarding this upgrade process, please consult the [`examples/`](https://github.com/terraform-aws-modules/terraform-aws-kms/tree/master/examples) projects:

If you find a bug, please open an issue with supporting configuration to reproduce.

## List of backwards incompatible changes

- Support for Terraform `<1.5.7` has been dropped; `1.5.7` is now the minimum supported version
- Terraform AWS provider minimum version is now `v6.0.0` in order to support the `region` argument in resources
- Variable `key_statements.conditions` is now `key_statements.condition`
- Variable `grants.constraints` has changed to type list

## Additional changes

### Added

- `region` to support creating resources in a different region than the provider region

### Modified

- `key_statements.conditions` changed to `key_statements.condition`
- `grants.constrants` changed to type list

### Variable and output changes

1. Removed variables:

  - None

2. Renamed variables:

  - `key_statements.conditions` -> `key_statements.condition`

3. Added variables:

  - `region`

4. Removed outputs:

  - None

5. Renamed outputs:

  - None

6. Added outputs:

  - `key_region` added to support output for setting the `region` variable

## Upgrade Migrations

The following examples demonstrate some of the changes that users can elect to make to avoid any potential disruptions when upgrading.

### Before 3.x Example

```hcl
module "kms" {
  source  = "terraform-aws-modules/kms/aws"
  version = "~> 3.0"

  # Only the affected attributes are shown
  key_statements = [
    {
      sid = "CloudWatchLogs"
      actions = [
        "kms:Encrypt*",
        "kms:Decrypt*",
        "kms:ReEncrypt*",
        "kms:GenerateDataKey*",
        "kms:Describe*"
      ]
      resources = ["*"]

      principals = [
        {
          type        = "Service"
          identifiers = ["logs.${data.aws_region.current.name}.amazonaws.com"]
        }
      ]

      conditions = [
        {
          test     = "ArnLike"
          variable = "kms:EncryptionContext:aws:logs:arn"
          values = [
            "arn:aws:logs:${local.region}:${data.aws_caller_identity.current.account_id}:log-group:*",
          ]
        }
      ]
    }
  ]

  # Grants
  grants = {
    lambda = {
      grantee_principal = aws_iam_role.lambda.arn
      operations        = ["Encrypt", "Decrypt", "GenerateDataKey"]
      constraints = {
        encryption_context_equals = {
          Department = "Finance"
        }
      }
    }
  }

  tags = local.tags
}
```

### After 4.x Example

```hcl
module "kms" {
  source  = "terraform-aws-modules/kms/aws"
  version = "~> 4.0"

  key_statements = [
    {
      sid = "CloudWatchLogs"
      actions = [
        "kms:Encrypt*",
        "kms:Decrypt*",
        "kms:ReEncrypt*",
        "kms:GenerateDataKey*",
        "kms:Describe*"
      ]
      resources = ["*"]

      principals = [
        {
          type        = "Service"
          identifiers = ["logs.${local.region}.amazonaws.com"]
        }
      ]

      condition = [
        {
          test     = "ArnLike"
          variable = "kms:EncryptionContext:aws:logs:arn"
          values = [
            "arn:aws:logs:${local.region}:${local.account_id}:log-group:*",
          ]
        }
      ]
    }
  ]

  # Grants
  grants = {
    lambda = {
      grantee_principal = aws_iam_role.lambda.arn
      operations        = ["Encrypt", "Decrypt", "GenerateDataKey"]
      constraints = [{
        encryption_context_equals = {
          Department = "Finance"
        }
      }]
    }
  }
}
```
