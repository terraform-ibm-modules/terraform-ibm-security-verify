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

output "isv_instance_credentials" {
  description = "Security Verify instance credentials, used for configuration APIs internal to the instance."
  value       = ibm_resource_key.isv_instance_key.credentials
  sensitive   = true
}

output "isv_instance_credentials_json" {
  description = "Security Verify instance credentials, used for configuration APIs internal to the instance."
  value       = ibm_resource_key.isv_instance_key.credentials_json
  sensitive   = true
}
