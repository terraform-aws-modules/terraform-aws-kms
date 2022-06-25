provider "aws" {
  region = local.region
}

locals {
  region = "us-east-1"
  name   = "kms-ex-${replace(basename(path.cwd), "_", "-")}"
  me     = data.aws_caller_identity.current.arn

  tags = {
    Name       = local.name
    Example    = "complete"
    Repository = "https://github.com/clowdhaus/terraform-aws-kms"
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
  key_owners                             = [local.me]
  key_administrators                     = [local.me]
  key_users                              = [local.me]
  key_service_users                      = [local.me]
  key_symmetric_encryption_users         = [local.me]
  key_hmac_users                         = [local.me]
  key_asymmetric_public_encryption_users = [local.me]
  key_asymmetric_sign_verify_users       = [local.me]

  # Aliases
  aliases                 = ["one", "foo/bar"]
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
