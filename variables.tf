##########################################
# REQUIRED INPUTS
##########################################

variable "project_id" {
  type        = string
  description = "GCP Project ID to provision resources in."
  default     = "htc-ref-backstage-gcp-devx"
}


variable "region" {
  type        = string
  description = "GCP Region to provision resources in."
  default     = "asia-south1"
}

variable "gar_repository_location" {
  type        = string
  description = "Location of the Google Artifact Registry repository,"
  default     = "asia-south1"
}

variable "gar_repository_id" {
  type        = string
  description = "Google Artifact Registry repository ID."
  default     = "htc-ref-backstage-gcp-devx"
}

##########################################
# OPTIONAL INPUTS
##########################################

variable "humanitec_prefix" {
  type        = string
  description = "A prefix that will be attached to all IDs created in Humanitec."
  default     = "htc-ref-arch-"
}

variable "with_backstage" {
  description = "Deploy Backstage"
  type        = bool
  default     = true
}

variable "github_org_id" {
  description = "GitHub org id (required for Backstage)"
  type        = string
  default     = "ltim-de"
}

variable "github_token" {
  description = "GitHub token (required for Backstage)"
  type        = string
  
}

variable "humanitec_org_id" {
  description = "Humanitec Organization ID."
  type        = string
  default     = "demo-humanitec"
}
