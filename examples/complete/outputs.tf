################################################################################
# Complete
################################################################################

output "complete_key_arn" {
  description = "The Amazon Resource Name (ARN) of the key"
  value       = module.kms_complete.key_arn
}

output "complete_key_id" {
  description = "The globally unique identifier for the key"
  value       = module.kms_complete.key_id
}

output "complete_key_policy" {
  description = "The IAM resource policy set on the key"
  value       = module.kms_complete.key_policy
}

output "complete_aliases" {
  description = "A map of aliases created and their attributes"
  value       = module.kms_complete.aliases
}

output "complete_grants" {
  description = "A map of grants created and their attributes"
  value       = module.kms_complete.grants
}

################################################################################
# Default
################################################################################

output "default_key_arn" {
  description = "The Amazon Resource Name (ARN) of the key"
  value       = module.kms_default.key_arn
}

output "default_key_id" {
  description = "The globally unique identifier for the key"
  value       = module.kms_default.key_id
}

output "default_key_policy" {
  description = "The IAM resource policy set on the key"
  value       = module.kms_default.key_policy
}

output "default_aliases" {
  description = "A map of aliases created and their attributes"
  value       = module.kms_default.aliases
}

output "default_grants" {
  description = "A map of grants created and their attributes"
  value       = module.kms_default.grants
}
