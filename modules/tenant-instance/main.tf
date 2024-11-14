/********************************************************************
This file creates an IBM Security Verify instance
*********************************************************************/

resource "ibm_resource_instance" "isv_instance" {
  name              = var.instance_name
  service           = "security-verify"
  plan              = var.plan
  location          = var.region
  resource_group_id = var.resource_group_id
  tags              = var.resource_tags

  parameters = {
    hostname = var.hostname
  }
}

resource "ibm_resource_tag" "access_tags" {
  resource_id = resource.ibm_resource_instance.isv_instance.crn
  tags        = var.access_tags
  tag_type    = "access"
}

resource "ibm_resource_key" "api_oauth2_credentials" {
  name                 = "${var.instance_name}-api-auth"
  resource_instance_id = ibm_resource_instance.isv_instance.id
  tags                 = var.resource_tags
}

########################################################################################################################
# Secrets manager
########################################################################################################################

module "sm_crn" {
  count   = var.existing_secrets_manager_crn != null ? 1 : 0
  source  = "terraform-ibm-modules/common-utilities/ibm//modules/crn-parser"
  version = "1.0.0"
  crn     = var.existing_secrets_manager_crn
}

# New secret group if existing not provided
module "secret_group" {
  count                    = var.existing_secrets_manager_crn != null && var.existing_secret_group_id == null ? 1 : 0
  source                   = "terraform-ibm-modules/secrets-manager-secret-group/ibm"
  version                  = "1.2.2"
  region                   = module.sm_crn[0].region
  secrets_manager_guid     = module.sm_crn[0].service_instance
  secret_group_name        = coalesce(var.secret_group_name, "ibmverify-${var.instance_name}")
  secret_group_description = "IBM Verify secrets and credentials"
  endpoint_type            = var.secrets_manager_endpoint_type
}

locals {
  secret_group_id        = var.existing_secrets_manager_crn == null ? null : (var.existing_secret_group_id == null ? module.secret_group[0].secret_group_id : var.existing_secret_group_id)
  credential_secret_name = "tenant-admin-oidc-${var.instance_name}"
}

module "tenant_credential_secret" {
  count                   = var.existing_secrets_manager_crn != null ? 1 : 0
  source                  = "terraform-ibm-modules/secrets-manager-secret/ibm"
  version                 = "1.3.2"
  region                  = module.sm_crn[0].region
  secrets_manager_guid    = module.sm_crn[0].service_instance
  secret_group_id         = local.secret_group_id
  endpoint_type           = var.secrets_manager_endpoint_type
  secret_name             = local.credential_secret_name
  secret_description      = "IBM Verify admin OIDC credentials for tenant ${var.instance_name}"
  secret_type             = "arbitrary"
  secret_payload_password = ibm_resource_key.api_oauth2_credentials.credentials_json
}
