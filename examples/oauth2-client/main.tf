module "oauth2-client" {
  source        = "../../modules/oauth2-client"
  prefix        = var.prefix
  client_name   = var.client_name
  redirect_uris = var.redirect_uris
  grant_types   = ["authorization_code"]
}
