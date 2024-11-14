########################################################################################################################
# Outputs
########################################################################################################################
output "isv_instance_name" {
  description = "The name of the IBM Security Verify instance."
  value       = ibm_resource_instance.isv_instance.name
}

output "crn" {
  description = "The IBM Security Verify instance CRN."
  value       = ibm_resource_instance.isv_instance.crn
}

output "guid" {
  description = "The globally unique identifier of the IBM Security Verify instance."
  value       = ibm_resource_instance.isv_instance.guid
}

output "account_url" {
  description = "The IBM Security Verify Account URL"
  value       = "https://${var.hostname}.verify.ibm.com/ui/admin/"
}

output "api_oauth2_credentials" {
  description = "The oauth2 credentials needed for API access to configure Security Verify features"
  value       = ibm_resource_key.api_oauth2_credentials.credentials
  sensitive   = true
}

output "api_oauth2_credentials_json" {
  description = "The oauth2 credentials, in JSON format, needed for API access to configure Security Verify features"
  value       = ibm_resource_key.api_oauth2_credentials.credentials_json
  sensitive   = true
}
