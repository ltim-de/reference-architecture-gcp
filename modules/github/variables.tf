variable "project_id" {
  type        = string
  description = "GCP Project ID to provision resources in."
  default     = "htc-ref-backstage-gcp-devx"
}

variable "gar_repository_id" {
  type        = string
  description = "Google Artifact Registry repository ID."
  default     = "htc-ref-backstage-gcp-devx"
}

variable "gar_repository_location" {
  type        = string
  description = "Location of the Google Artifact Registry repository."
  default     = "asia-south1"
}

variable "humanitec_org_id" {
  description = "Humanitec Organization ID."
  type        = string
  default     = "demo-humanitec"

  validation {
    condition     = var.humanitec_org_id != null
    error_message = "Humanitec Organization ID must not be empty"
  }
}

variable "humanitec_ci_service_user_token" {
  description = "Humanitec CI Service User Token"
  type        = string
  sensitive   = true
  
  default     = "RVC24hAgO6KZv45dEyLyoOAc0bqWotwNes-GucP6QZWe"

  validation {
    condition     = var.humanitec_ci_service_user_token != null
    error_message = "Humanitec CI Service User Token must not be empty"
  }
}

variable "github_org_id" {
  description = "GitHub org id"
  type        = string

  default     = "ltim-de"

  validation {
    condition     = var.github_org_id != null
    error_message = "GitHub org id must not be empty"
  }
}