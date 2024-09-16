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
