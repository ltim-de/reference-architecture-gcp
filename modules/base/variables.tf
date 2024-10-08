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

variable "humanitec_org_id" {
  description = "Humanitec Organization ID."
  type        = string
  default     = "demo-humanitec"
}

##########################################
# OPTIONAL INPUTS
##########################################

variable "humanitec_prefix" {
  type        = string
  description = "A prefix that will be attached to all IDs created in Humanitec."
  default     = "htc-ref-arch-"
}

##########################################
# VPC INPUTS (All optional)
##########################################
variable "vpc_name" {
  type        = string
  description = "VPC Name"
  default     = "htc-ref-arch-vpc"
}

variable "vpc_description" {
  type        = string
  description = "VPC Description"
  default     = "VPC for Humanitec Reference Architecture Implementation for GCP. https://github.com/ltim-de/reference-archietcture-gcp"
}

variable "vpc_subnets" {
  type = list(object({
    name                     = string
    description              = string
    ip_cidr_range            = string
    purpose                  = optional(string)
    role                     = optional(string)
    region                   = optional(string)
    private_ip_google_access = optional(bool)
    secondary_ip_range = optional(list(object({
      range_name    = string
      ip_cidr_range = string
    })))
  }))
  description = "List of VPC Subnets"
  default = [
    {
      name          = "htc-ref-arch-subnet"
      description   = "Subnet that hosts resources provisioned for the Humanitec Reference Architecture Implementation for GCP. https://github.com/ltim-de/reference-archietcture-gcp"
      ip_cidr_range = "10.128.0.0/20"
    }
  ]
}

##########################################
# GKE INPUTS (All optional)
##########################################

variable "gke_cluster_name" {
  description = "The name of the GKE Cluster. Must be unique within the project."
  type        = string
  default     = "htc-ref-arch-cluster"
}

variable "gke_subnet_name" {
  description = "The name of the subnet to allocate IPs for the GKE Cluster from. If vpc_subnet is set, this must be updated."
  type        = string
  default     = "htc-ref-arch-subnet"
}

variable "gke_autopilot" {
  description = "Whether GKE Autopilot should be used"
  type        = bool
  default     = true
}

variable "gar_repository_id" {
  type        = string
  description = "ID of the Google Artifact Registry repository (not created if empty)."
  default     = "htc-ref-backstage-gcp-devx"
}

variable "gar_repository_location" {
  type        = string
  description = "Location of the Google Artifact Registry repository (required when gar_repository_id is set)."
  default     = "asia-south1"
}
