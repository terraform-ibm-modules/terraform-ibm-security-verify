########################################################################################################################
# Input Variables
########################################################################################################################

variable "resource_group_id" {
  description = "The ID of the resource group where the IBM Security Verify instance is created."
  type        = string
}

variable "hostname" {
  type        = string
  description = "The hostname of the IBM Security Verify instance that is created by this module."
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

variable "prefix" {
  type        = string
  description = "The prefix that you would like to append to your resources."
}

variable "tags" {
  type        = list(string)
  description = "The list of tags to add to the IBM Security Verify instance."
  default     = []
}
