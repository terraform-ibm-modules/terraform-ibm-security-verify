locals {
  # for client name, use the supplied name if not null, otherwise use the prefix with static suffix
  full_client_name = var.client_name != null ? var.client_name : var.prefix != null ? "${var.prefix}-oauth2-client" : "oauth2-client"
}

resource "ibmverify_oauth2_client" "client" {
  client_name                           = local.full_client_name
  access_policy                         = var.verify_access_policy
  all_users_entitled                    = var.all_users_entitled
  authorization_encrypted_response_alg  = var.authorization_encrypted_response_alg
  authorization_encrypted_response_enc  = var.authorization_encrypted_response_enc
  authorization_signed_response_alg     = var.authorization_signed_response_alg
  client_secret_expires_at              = var.client_secret_expires_at
  consent_action                        = var.consent_action
  enforce_pkce                          = var.enforce_pkce
  grant_types                           = var.grant_types
  id_token_signed_response_alg          = var.id_token_signed_response_alg
  redirect_uris                         = var.redirect_uris
  request_object_check_expiry           = var.request_object_check_expiry
  request_object_lifetime               = var.request_object_lifetime
  request_object_parameters_only        = var.request_object_parameters_only
  request_object_signing_alg            = var.request_object_signing_alg
  require_pushed_authorization_requests = var.require_pushed_authorization_requests
  response_types                        = var.response_types
  restrict_api_entitlements             = var.restrict_api_entitlements
  token_endpoint_auth_method            = var.token_endpoint_auth_method
  token_endpoint_auth_single_use_jti    = var.token_endpoint_auth_single_use_jti
}
