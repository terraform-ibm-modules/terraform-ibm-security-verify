variable "tenant_url" {
  type        = string
  description = "The tenant URL for IBM Verify"
}

variable "service_cred_client_id" {
  type        = string
  description = "The service credential client ID"
}

variable "service_cred_client_secret" {
  type        = string
  description = "The service credential client secret"
  sensitive   = true
}

variable "prefix" {
  description = "Prefix to be used to generate a client name if not directly supplied"
  type        = string
  default     = null
}

variable "client_name" {
  description = "Name of the oauth2 client to create, if not supplied one will be generated using a supplied prefix"
  type        = string
  default     = null
}

variable "redirect_uris" {
  description = "tbd"
  type        = list(string)
  default     = ["https://localhost/oauth"]
}
