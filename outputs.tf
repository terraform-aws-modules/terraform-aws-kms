################################################################################
# Key
################################################################################

output "key_arn" {
  description = "The Amazon Resource Name (ARN) of the key"
  value       = try(aws_kms_key.this[0].arn, null)
}

output "key_id" {
  description = "The globally unique identifier for the key"
  value       = try(aws_kms_key.this[0].key_id, null)
}

output "key_policy" {
  description = "The IAM resource policy set on the key"
  value       = try(aws_kms_key.this[0].policy, null)
}

################################################################################
# Alias
################################################################################

output "aliases" {
  description = "A map of aliases created and their attributes"
  value       = aws_kms_alias.this
}

################################################################################
# Grant
################################################################################

output "grants" {
  description = "A map of grants created and their attributes"
  value       = aws_kms_grant.this
}
