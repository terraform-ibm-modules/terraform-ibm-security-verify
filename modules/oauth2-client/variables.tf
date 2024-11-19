variable "prefix" {
  description = "Prefix to be used to generate a client name (ignored if `client_name` is supplied)"
  type        = string
  default     = null
}

variable "client_name" {
  description = "Name of the oauth2 client to create in the verify tenant, if not supplied one will be generated using a supplied `prefix`"
  type        = string
  default     = null
}

variable "redirect_uris" {
  description = "Array of redirection URIs for use in redirect-based flows. (required)"
  type        = list(string)
}

variable "verify_access_policy" {
  description = "Security Verify Access Policy Id to apply to this client"
  type        = string
  default     = null
}

variable "all_users_entitled" {
  description = "Set to true if all users are entitled to use this client."
  type        = bool
  default     = null
}

variable "authorization_encrypted_response_alg" {
  description = "JWE 'alg' algorithm required for encrypting authorization responses."
  type        = string
  default     = null
}

variable "authorization_encrypted_response_enc" {
  description = "JWE 'enc' algorithm required for encrypting authorization responses."
  type        = string
  default     = null
}

variable "authorization_signed_response_alg" {
  description = "JWS 'alg' required for signing authorization responses."
  type        = string
  default     = null
}

variable "client_secret_expires_at" {
  description = "Time when the generated `client_secret` will expire. Set to `0` to never expire. Its value is a JSON number representing the number of seconds from 1970-01-01T00:00:00Z as measured in UTC until the date/time."
  type        = number
  default     = 0
  nullable    = false
}

variable "consent_action" {
  description = "Request for user consent."
  type        = string
  default     = null

  validation {
    condition     = contains(["always_prompt", "never_prompt", "set_to_null"], coalesce(var.consent_action, "set_to_null"))
    error_message = "consent_action must be one of `always_prompt` or `never_prompt`."
  }
}

variable "enforce_pkce" {
  description = "Enforce the usage of PKCE."
  type        = bool
  default     = null
}

variable "grant_types" {
  description = "Array of grant types that the client may use. The allowed grant types are 'authorization_code', 'implicit', 'password', and 'refresh_token'."
  type        = list(string)
  default     = null

  validation {
    condition = var.grant_types == null ? true : alltrue([
      for grant in var.grant_types : contains(["authorization_code", "implicit", "password", "refresh_token"], grant)
    ])
    error_message = "The allowed grant types are 'authorization_code', 'implicit', 'password', and 'refresh_token'."
  }
}

variable "id_token_signed_response_alg" {
  description = "Token signing algorithm required for signing the ID token issued for this client."
  type        = string
  default     = null
}

variable "request_object_check_expiry" {
  description = "Flag to indicate whether expiry claims should be set in the request object."
  type        = bool
  default     = null
}

variable "request_object_lifetime" {
  description = "The lifetime of the request object (in seconds)."
  type        = number
  default     = null
}

variable "request_object_parameters_only" {
  description = "Flag to suggest whether all the request parameters should only be in the request object."
  type        = bool
  default     = null
}

variable "request_object_signing_alg" {
  description = "JWS 'alg' algorithm that MUST be used for signing Request Objects sent to the OP."
  type        = string
  default     = null
}

variable "require_pushed_authorization_requests" {
  description = "Flag to indicate whether pushed authorization request (PAR) is required."
  type        = bool
  default     = null
}

variable "response_types" {
  description = "Array of the OAuth 2.0 response types that the client may use."
  type        = list(string)
  default     = null

  validation {
    condition = var.response_types == null ? true : alltrue([
      for resp in var.response_types : contains(["id_token", "token", "code", "none"], resp)
    ])
    error_message = "response_types can only contain values `id_token`, `token`, `code`, `none`."
  }
}

variable "restrict_api_entitlements" {
  description = "Flag to indicate whether API entitlements should be restricted."
  type        = bool
  default     = null
}

variable "token_endpoint_auth_method" {
  description = "The client authentication method for the token endpoint."
  type        = string
  default     = null

  validation {
    condition     = contains(["default", "client_secret_basic", "client_secret_post", "private_key_jwt", "tls_client_auth", "set_to_null"], coalesce(var.token_endpoint_auth_method, "set_to_null"))
    error_message = "auth method must be one of `default`, `client_secret_basic`, `client_secret_post`, `private_key_jwt`, `tls_client_auth`."
  }
}

variable "token_endpoint_auth_single_use_jti" {
  description = "Flag to indicate whether the JTI for token endpoint is single-use only."
  type        = bool
  default     = null
}

########################################################################################################################
# Secrets Manager - in which to store the IBM Cloud resource key credentials to the tenant instance
########################################################################################################################

variable "existing_secrets_manager_crn" {
  type        = string
  description = "The CRN of a secrets manager to store IBM Cloud resource key credentials of tenant. If not supplied, credentials will not be stored and must be retrieved from Terraform Outputs as a sensitive value."
  default     = null
}

variable "existing_secret_group_id" {
  type        = string
  description = "The ID of an existing secret group to store any new secrets in."
  default     = null
}

variable "secret_group_name" {
  type        = string
  description = "The name of a secret group to create to store any new secrets in. If not provided, the group name will be based on instance name (`ibmverify-instancename`)."
  default     = null
}

variable "secrets_manager_endpoint_type" {
  type        = string
  description = "The service endpoint type to communicate with the provided secrets manager instance. Possible values are `public` or `private`"
  default     = "public"
  nullable    = false
  validation {
    condition     = contains(["public", "private"], var.secrets_manager_endpoint_type)
    error_message = "The specified endpoint_type is not a valid selection!"
  }
}
