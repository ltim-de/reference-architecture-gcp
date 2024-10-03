variable "humanitec_org_id" {
  description = "Humanitec Organization ID"
  type        = string
  default     = "demo-humanitec"
}

variable "humanitec_ci_service_user_token" {
  description = "Humanitec CI Service User Token"
  type        = string
  sensitive   = true
  default     = "RVC24hAgO6KZv45dEyLyoOAc0bqWotwNes-GucP6QZWe"
}

variable "github_org_id" {
  description = "GitHub org id"
  type        = string
  default     = "ltim-de"
}

variable "github_app_client_id" {
  description = "GitHub App Client ID"
  type        = string
  default     = "Iv23liGH6VgiVGr96ZnU"
}

variable "github_app_client_secret" {
  description = "GitHub App Client Secret"
  type        = string
  default     = "70e7241718c880aff9a3839228f64c0057285d8e"
}

variable "github_app_id" {
  description = "GitHub App ID"
  type        = string
  default     = "1008077"
}

variable "github_webhook_secret" {
  description = "GitHub Webhook Secret"
  type        = string
  default     = "5f2930110ed900f5141cffdab33a6f11eba922f4"
}

variable "github_app_private_key" {
  description = "GitHub App Private Key"
  type        = string
  default     = "/EbsX27vUjIcmMBFtNs8VYDz0qHm5CnCcPGGHn7PO9s="
}

