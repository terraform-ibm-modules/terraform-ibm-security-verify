output "client_id" {
  description = "OIDC client id"
  value       = module.oauth2-client.client_id
}

output "client_secret" {
  description = "OIDC client secret"
  value       = module.oauth2-client.client_secret
  sensitive   = true
}

output "client_data" {
  value     = module.oauth2-client.full_client_data_map
  sensitive = true
}
