########################################################################################################################
# Input Variables
########################################################################################################################

variable "resource_group_id" {
  description = "The ID of the resource group where the IBM Security Verify instance is created."
  type        = string
}

variable "hostname" {
  type        = string
  description = "The hostname of the IBM Security Verify instance which is used to construct the Dashboard/Account URL in the format: https://<hostname>.verify.ibm.com/ui/admin/. Note: After the service instance creation returns, the instance may take up to two minutes to be available."
  validation {
    condition     = can(regex("^([a-z0-9-]{1,62}[a-z0-9])?$", var.hostname))
    error_message = "The value can only contain lowercase letters, numbers, and '-', must end with a letter or number, and have a maximum length of 63 characters."
  }
}

variable "plan" {
  type        = string
  description = "The pricing plan of the IBM Security Verify instance.Possible values: `verify-lite`"
  default     = "verify-lite"
  validation {
    condition     = contains(["verify-lite"], var.plan)
    error_message = "The specified pricing plan is not available. The following plans are supported: `verify-lite`"
  }
}

variable "region" {
  type        = string
  description = "The IBM Cloud region where the IBM Security Verify resource is created.Possible values: `eu-de` (Frankfurt)"
  default     = "eu-de"
  validation {
    condition     = contains(["eu-de"], var.region)
    error_message = "The specified region is not supported. The following regions are supported: `eu-de` (Frankfurt)"
  }
}

variable "instance_name" {
  type        = string
  description = "The name of the IBM Security Verify instance."
}

variable "resource_tags" {
  description = "A list of tags to apply to resources created by the module."
  type        = list(string)
  default     = []
}

variable "access_tags" {
  type        = list(string)
  description = "A list of access tags to apply to the resources created by the module. For more information, see https://cloud.ibm.com/docs/account?topic=account-access-tags-tutorial."
  default     = []

  validation {
    condition = alltrue([
      for tag in var.access_tags : can(regex("[\\w\\-_\\.]+:[\\w\\-_\\.]+", tag)) && length(tag) <= 128
    ])
    error_message = "Tags must match the regular expression \"[\\w\\-_\\.]+:[\\w\\-_\\.]+\". For more information, see https://cloud.ibm.com/docs/account?topic=account-tag&interface=ui#limits."
  }
}
