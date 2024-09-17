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

# output "isv_instance_account_url" {
#   description = "The Account URL of the IBM Security Verify instance."
#   value       = ibm_resource_instance.isv_instance.account_url
# }
# Note: Couldn't find specific attributes or methods for obtaining the dashboard/account URL.
