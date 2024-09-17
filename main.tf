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
