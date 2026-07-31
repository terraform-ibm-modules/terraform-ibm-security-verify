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

  timeouts {
    create = "30m"
  }
}

# Check whether access tags are valid and exist in the account
data "ibm_iam_access_tag" "access_tags" {
  for_each = length(var.access_tags) != 0 ? toset(var.access_tags) : [] # Force dependency on data source validation to ensure access_tags exist and are valid before use.
  name     = each.value
}

resource "ibm_resource_tag" "access_tags" {
  depends_on  = [data.ibm_iam_access_tag.access_tags] # Force dependency on data source validation to ensure access_tags exist and are valid before use.
  resource_id = resource.ibm_resource_instance.isv_instance.crn
  tags        = var.access_tags
  tag_type    = "access"
}
