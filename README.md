<!-- Update this title with a descriptive name. Use sentence case. -->
# IBM Security Verify module

<!--
Update status and "latest release" badges:
  1. For the status options, see https://terraform-ibm-modules.github.io/documentation/#/badge-status
  2. Update the "latest release" badge to point to the correct module's repo. Replace "terraform-ibm-module-template" in two places.
-->
[![Stable (With quality checks)](https://img.shields.io/badge/Status-Stable%20(With%20quality%20checks)-green)](https://terraform-ibm-modules.github.io/documentation/#/badge-status)
[![latest release](https://img.shields.io/github/v/release/terraform-ibm-modules/terraform-ibm-security-verify?logo=GitHub&sort=semver)](https://github.com/terraform-ibm-modules/terraform-ibm-security-verify/releases/latest)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![Renovate enabled](https://img.shields.io/badge/renovate-enabled-brightgreen.svg)](https://renovatebot.com/)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)

<!--
Add a description of modules in this repo.
Expand on the repo short description in the .github/settings.yml file.

For information, see "Module names and descriptions" at
https://terraform-ibm-modules.github.io/documentation/#/implementation-guidelines?id=module-names-and-descriptions
-->

This module is used to create an IBM Security Verify instance to provide Single Sign-On (SSO), multi-factor authentication (MFA), identity governance, and identity lifecycle controls for internal (workforce) and external (consumer) user types.

**Note:** As of now, this Terraform module only supports the creation of an IBM Security Verify instance. It does not yet support attaching applications to provide identity and access management services.

For more information, see [IBM Security Verify Documentation Hub](https://docs.verify.ibm.com/verify)


<!-- The following content is automatically populated by the pre-commit hook -->
<!-- BEGIN OVERVIEW HOOK -->
## Overview
* [terraform-ibm-security-verify](#terraform-ibm-security-verify)
* [Examples](./examples)
    * <div style="display: inline-block;"><a href="./examples/basic">Basic example</a></div> <div style="display: inline-block; vertical-align: middle;"><a href="https://cloud.ibm.com/schematics/workspaces/create?workspace_name=sv-basic-example&repository=github.com/terraform-ibm-modules/terraform-ibm-security-verify/tree/main/examples/basic" target="_blank"><img src="https://cloud.ibm.com/media/docs/images/icons/Deploy_to_cloud.svg" alt="Deploy to IBM Cloud button"></a></div>
* [Contributing](#contributing)
<!-- END OVERVIEW HOOK -->


<!--
If this repo contains any reference architectures, uncomment the heading below and link to them.
(Usually in the `/reference-architectures` directory.)
See "Reference architecture" in the public documentation at
https://terraform-ibm-modules.github.io/documentation/#/implementation-guidelines?id=reference-architecture
-->
<!-- ## Reference architectures -->


<!-- Replace this heading with the name of the root level module (the repo name) -->
## terraform-ibm-security-verify

### Usage
<!--
Add an example of the use of the module in the following code block.

Use real values instead of "var.<var_name>" or other placeholder values
unless real values don't help users know what to change.
-->

```hcl
module "isv_instance" {
  source            = "terraform-ibm-modules/security-verify/ibm"
  version           = "X.X.X" # Replace "X.X.X" with a release version to lock into a specific release
  resource_group_id = "a8cff104f1764e98aac9ab879198230a" # pragma: allowlist secret
  instance_name     = "ibm-security-verify-instance"
  hostname          = "my-security-verify-tenant"
  access_tags       = ["env:dev","env:test"]
  tags              = ["dev", "qa"]
  region            = "eu-de"
}
```
### Required access policies

<!-- PERMISSIONS REQUIRED TO RUN MODULE
If this module requires permissions, uncomment the following block and update
the sample permissions, following the format.
Replace the 'Sample IBM Cloud' service and roles with applicable values.
The required information can usually be found in the services official
IBM Cloud documentation.
To view all available service permissions, you can go in the
console at Manage > Access (IAM) > Access groups and click into an existing group
(or create a new one) and in the 'Access' tab click 'Assign access'.
-->

You need the following permissions to run this module:

- Service
    - **Resource group only**
        - `Viewer` access on the specific resource group
    - **IBM Verify** service
        - `Editor` platform access

<!-- NO PERMISSIONS FOR MODULE
If no permissions are required for the module, uncomment the following
statement instead the previous block.
-->

<!-- No permissions are needed to run this module.-->


<!-- The following content is automatically populated by the pre-commit hook -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.79.0, < 2.0.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [ibm_resource_instance.isv_instance](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/resource_instance) | resource |
| [ibm_resource_tag.access_tags](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/resource_tag) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_tags"></a> [access\_tags](#input\_access\_tags) | A list of access tags to apply to the resources created by the module. For more information, see https://cloud.ibm.com/docs/account?topic=account-access-tags-tutorial. | `list(string)` | `[]` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | The hostname of the IBM Security Verify instance which is used to construct the Dashboard/Account URL in the format: https://<hostname>.verify.ibm.com/ui/admin/. Note: After the service instance creation returns, the instance may take up to two minutes to be available. | `string` | n/a | yes |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | The name of the IBM Security Verify instance. | `string` | n/a | yes |
| <a name="input_plan"></a> [plan](#input\_plan) | The pricing plan of the IBM Security Verify instance.Possible values: `verify-lite` | `string` | `"verify-lite"` | no |
| <a name="input_region"></a> [region](#input\_region) | The IBM Cloud region where the IBM Security Verify resource is created.Possible values: `eu-de` (Frankfurt) | `string` | `"eu-de"` | no |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | The ID of the resource group where the IBM Security Verify instance is created. | `string` | n/a | yes |
| <a name="input_resource_tags"></a> [resource\_tags](#input\_resource\_tags) | A list of tags to apply to resources created by the module. | `list(string)` | `[]` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_account_url"></a> [account\_url](#output\_account\_url) | The IBM Security Verify Account URL |
| <a name="output_crn"></a> [crn](#output\_crn) | The IBM Security Verify instance CRN. |
| <a name="output_guid"></a> [guid](#output\_guid) | The globally unique identifier of the IBM Security Verify instance. |
| <a name="output_isv_instance_name"></a> [isv\_instance\_name](#output\_isv\_instance\_name) | The name of the IBM Security Verify instance. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- Leave this section as is so that your module has a link to local development environment set-up steps for contributors to follow -->
## Contributing

You can report issues and request features for this module in GitHub issues in the module repo. See [Report an issue or request a feature](https://github.com/terraform-ibm-modules/.github/blob/main/.github/SUPPORT.md).

To set up your local development environment, see [Local development setup](https://terraform-ibm-modules.github.io/documentation/#/local-dev-setup) in the project documentation.
