########################################################################################################################
# Outputs
########################################################################################################################

output "isv_instance_name" {
  description = "The name of the IBM Security Verify instance."
  value       = module.isv_instance.isv_instance_name
}

output "resource_group_name" {
  description = "Resource group name"
  value       = module.resource_group.resource_group_name
}

output "crn" {
  description = "The IBM Security Verify instance CRN."
  value       = module.isv_instance.crn
}

output "guid" {
  description = "The globally unique identifier of the IBM Security Verify instance."
  value       = module.isv_instance.guid
}

output "account_url" {
  description = "The IBM Security Verify Account URL"
  value       = module.isv_instance.account_url
}

output "api_oauth2_credentials" {
  description = "The oauth2 credentials needed for API access to configure Security Verify features"
  value       = module.isv_instance.api_oauth2_credentials
  sensitive   = true
}

output "api_oauth2_credentials_json" {
  description = "The oauth2 credentials, in JSON format, needed for API access to configure Security Verify features"
  value       = module.isv_instance.api_oauth2_credentials_json
  sensitive   = true
}
