provider "aws" {
  region = local.region
}

data "aws_caller_identity" "current" {}

locals {
  region           = "us-east-1"
  region_secondary = "eu-west-1"
  name             = "kms-ex-${basename(path.cwd)}"

  account_id       = data.aws_caller_identity.current.account_id
  current_identity = data.aws_caller_identity.current.arn

  # Removes noise from hh:mm:ss in the timestamp
  valid_to = replace(timeadd(plantimestamp(), "4380h"), "/T.*/", "T00:00:00Z") # 6 months

  tags = {
    Name       = local.name
    Example    = "complete"
    Repository = "https://github.com/terraform-aws-modules/terraform-aws-kms"
  }
}

################################################################################
# KMS Module
################################################################################

module "kms_complete" {
  source = "../.."

  deletion_window_in_days = 7
  description             = "Complete key example showing various configurations available"
  enable_key_rotation     = false
  is_enabled              = true
  key_usage               = "ENCRYPT_DECRYPT"
  multi_region            = false

  # Policy
  enable_default_policy                  = true
  key_owners                             = [local.current_identity]
  key_administrators                     = [local.current_identity]
  key_users                              = [local.current_identity]
  key_service_users                      = [local.current_identity]
  key_service_roles_for_autoscaling      = ["arn:aws:iam::${local.account_id}:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"]
  key_symmetric_encryption_users         = [local.current_identity]
  key_hmac_users                         = [local.current_identity]
  key_asymmetric_public_encryption_users = [local.current_identity]
  key_asymmetric_sign_verify_users       = [local.current_identity]
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

  # Aliases
  aliases = ["one", "foo/bar"]
  computed_aliases = {
    ex = {
      # Sometimes you want to pass in an upstream attribute as the name and
      # that conflicts with using `for_each over a `toset()` since the value is not
      # known until after applying. Instead, we can use `computed_aliases` to work
      # around this limitation
      # Reference: https://github.com/hashicorp/terraform/issues/30937
      name = aws_iam_role.lambda.name
    }
  }
  aliases_use_name_prefix = true

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

  tags = local.tags
}

module "kms_external" {
  source = "../.."

  deletion_window_in_days = 7
  description             = "External key example"
  create_external         = true
  is_enabled              = true
  key_material_base64     = "Wblj06fduthWggmsT0cLVoIMOkeLbc2kVfMud77i/JY="
  multi_region            = false
  valid_to                = local.valid_to

  tags = local.tags
}

module "kms_dnssec_signing" {
  source = "../.."

  description = "CMK for Route53 DNSSEC signing"

  key_usage                = "SIGN_VERIFY"
  customer_master_key_spec = "ECC_NIST_P256"

  enable_route53_dnssec = true
  enable_key_rotation   = false
  route53_dnssec_sources = [
    {
      accounts_ids    = [local.account_id]               # can ommit if using current account ID which is default
      hosted_zone_arn = "arn:aws:route53:::hostedzone/*" # can ommit, this is default value
    }
  ]

  aliases = ["route53/dnssec-ex"]

  tags = local.tags
}

module "kms_default" {
  source = "../.."

  tags = local.tags
}

module "kms_disabled" {
  source = "../.."

  create = false
}

################################################################################
# Replica Key Example
################################################################################

module "kms_primary" {
  source = "../.."

  deletion_window_in_days = 7
  description             = "Primary key of replica key example"
  enable_key_rotation     = false
  is_enabled              = true
  key_usage               = "ENCRYPT_DECRYPT"
  multi_region            = true

  aliases = ["primary-standard"]

  tags = local.tags
}

module "kms_replica" {
  source = "../.."

  region = local.region_secondary

  deletion_window_in_days = 7
  description             = "Replica key example showing various configurations available"
  create_replica          = true
  primary_key_arn         = module.kms_primary.key_arn
  enable_default_policy   = true

  key_owners         = [local.current_identity]
  key_administrators = [local.current_identity]
  key_users          = [local.current_identity]

  # Aliases
  aliases = ["replica-standard"]
  computed_aliases = {
    ex = {
      # Sometimes you want to pass in an upstream attribute as the name and
      # that conflicts with using `for_each over a `toset()` since the value is not
      # known until after applying. Instead, we can use `computed_aliases` to work
      # around this limitation
      # Reference: https://github.com/hashicorp/terraform/issues/30937
      name = aws_iam_role.lambda.name
    }
  }

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

  tags = local.tags
}

################################################################################
# Replica External Key Example
################################################################################

module "kms_primary_external" {
  source = "../.."

  deletion_window_in_days = 7
  description             = "Primary external key of replica external key example"
  is_enabled              = true
  create_external         = true
  key_material_base64     = "Wblj06fduthWggmsT0cLVoIMOkeLbc2kVfMud77i/JY="
  multi_region            = true
  valid_to                = local.valid_to

  aliases = ["primary-external"]

  tags = local.tags
}

module "kms_replica_external" {
  source = "../.."

  region = local.region_secondary

  deletion_window_in_days = 7
  description             = "Replica external key example showing various configurations available"
  create_replica_external = true
  is_enabled              = true
  # key material must be the same as the primary's
  key_material_base64      = "Wblj06fduthWggmsT0cLVoIMOkeLbc2kVfMud77i/JY="
  primary_external_key_arn = module.kms_primary_external.key_arn
  valid_to                 = local.valid_to

  aliases = ["replica-external"]

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

  tags = local.tags
}

################################################################################
# Supporting Resources
################################################################################

resource "aws_iam_role" "lambda" {
  name_prefix = local.name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}
