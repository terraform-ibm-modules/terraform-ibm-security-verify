########################################################################################################################
# Resource group
########################################################################################################################

module "resource_group" {
  source  = "terraform-ibm-modules/resource-group/ibm"
  version = "1.6.1"
  # if an existing resource group is not set (null) create a new one using prefix
  resource_group_name          = var.resource_group == null ? "${var.prefix}-resource-group" : null
  existing_resource_group_name = var.resource_group
}

########################################################################################################################
# Random suffix to ensure a globally unique IBM Verify hostname on every deployment
########################################################################################################################

resource "random_string" "hostname_suffix" {
  length  = 6
  lower   = true
  numeric = true
  upper   = false
  special = false
}

########################################################################################################################
# IBM Security Verify instance
########################################################################################################################

module "isv_instance" {
  source            = "../../"
  resource_group_id = module.resource_group.resource_group_id
  hostname          = "${var.prefix}-${random_string.hostname_suffix.result}"
  region            = var.region
  instance_name     = "${var.prefix}-isv"
  resource_tags     = var.resource_tags
  access_tags       = var.access_tags
}
