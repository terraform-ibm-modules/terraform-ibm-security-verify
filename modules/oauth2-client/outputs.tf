
output "id" {
  description = "Internal IBM Verify ID of this client."
  value       = ibmverify_oauth2_client.client.id
}

output "client_name" {
  description = "Name of application in IBM Verify tenant."
  value       = ibmverify_oauth2_client.client.client_name
}

output "client_id" {
  description = "Client ID used for authorization."
  value       = ibmverify_oauth2_client.client.client_id
}

output "client_secret" {
  description = "Client Secret used for authorization."
  value       = ibmverify_oauth2_client.client.client_secret
  sensitive   = true
}

output "client_secret_expires_at" {
  description = "Time at which the client secret expires."
  value       = ibmverify_oauth2_client.client.client_secret_expires_at
}

output "client_id_issued_at" {
  description = "Time at which the client identifier was assigned."
  value       = ibmverify_oauth2_client.client.client_id_issued_at
}

output "registration_client_uri" {
  description = "URL of the client configuration endpoint for this client."
  value       = ibmverify_oauth2_client.client.registration_client_uri
}

output "registration_access_token" {
  description = "Access token that is used to run subsequent operations at the client configuration endpoint."
  value       = ibmverify_oauth2_client.client.registration_access_token
  sensitive   = true
}

output "redirect_uris" {
  description = "Array of redirection URIs for use in redirect-based flows."
  value       = ibmverify_oauth2_client.client.redirect_uris
}

output "grant_types" {
  description = "Array of grant types that the client can use. The allowed grant types are 'authorization_code', 'implicit', 'password', 'refresh_token' and 'urn:ietf:params:oauth:grant-type:device_code'."
  value       = ibmverify_oauth2_client.client.grant_types
}

output "response_types" {
  description = "Array of the OAuth 2.0 response types that the client may use."
  value       = ibmverify_oauth2_client.client.response_types
}

output "id_token_signed_response_alg" {
  description = "Token signing algorithm. Required for signing the ID token assigned for this client."
  value       = ibmverify_oauth2_client.client.id_token_signed_response_alg
}

output "initiate_login_uri" {
  description = "URI that uses the https scheme that a third party can use to initiate a login by the RP."
  value       = ibmverify_oauth2_client.client.initiate_login_uri
}

output "all_users_entitled" {
  description = "True if all users are entitled to use this client."
  value       = ibmverify_oauth2_client.client.all_users_entitled
}

output "full_client_data_map" {
  description = "All output values returned from client creation."
  value       = ibmverify_oauth2_client.client
  sensitive   = true
}
