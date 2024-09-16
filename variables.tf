########################################################################################################################
# Input Variables
########################################################################################################################

variable "resource_group_id" {
  description = "The ID of the resource group where the IBM Security Verify instance is created."
  type        = string
}

variable "hostname" {
  type        = string
  description = "The hostname of the IBM Security Verify instance that is created by this module. Note: After the service instance creation returns, the instance may take up to two minutes to be available."
}

variable "plan" {
  type        = string
  description = "The pricing plan of the IBM Security Verify instance."
  default     = "verify-lite"
  validation {
    condition     = contains(["verify-lite"], var.plan)
    error_message = "The specified pricing plan is not available. The following plans are supported: `verify-lite`"
  }
}

variable "region" {
  type        = string
  description = "The IBM Cloud region where the IBM Security Verify resource is created."
  default     = "eu-de"
  validation {
    condition     = contains(["eu-de"], var.region)
    error_message = "The specified region is not supported. The following regions are supported: `eu-de`"
  }
}

variable "instance_name" {
  type        = string
  description = "The name of the IBM Security Verify instance."
}

variable "tags" {
  type        = list(string)
  description = "The list of tags to add to the IBM Security Verify instance."
  default     = []
}
