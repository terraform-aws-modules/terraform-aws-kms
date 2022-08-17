provider "aws" {
  region = local.region
}

locals {
  region           = "us-east-1"
  name             = "kms-ex-${replace(basename(path.cwd), "_", "-")}"
  current_identity = data.aws_caller_identity.current.arn

  tags = {
    Name       = local.name
    Example    = "complete"
    Repository = "https://github.com/terraform-aws-modules/terraform-aws-kms"
  }
}

data "aws_caller_identity" "current" {}

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
  key_symmetric_encryption_users         = [local.current_identity]
  key_hmac_users                         = [local.current_identity]
  key_asymmetric_public_encryption_users = [local.current_identity]
  key_asymmetric_sign_verify_users       = [local.current_identity]

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
      constraints = {
        encryption_context_equals = {
          Department = "Finance"
        }
      }
    }
  }

  tags = local.tags
}

module "kms_external" {
  source = "../.."

  deletion_window_in_days = 7
  description             = "External key example"
  is_enabled              = true
  key_material_base64     = "Wblj06fduthWggmsT0cLVoIMOkeLbc2kVfMud77i/JY="
  multi_region            = false
  valid_to                = "2085-04-12T23:20:50.52Z"

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
