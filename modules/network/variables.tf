# #########################################
# VARIABLES DEFINITION
# #########################################
#
variable "project_id" {
  type        = string
  description = "GCP Project ID"
  default     = "htc-ref-backstage-gcp-devx"
}

variable "region" {
  type        = string
  description = "GCP Region"
  default     = "asia-south1"
}

# VPC Variables
variable "vpc_name" {
  type        = string
  description = "VPC Name"
}
variable "vpc_description" {
  type        = string
  description = "VPC Description"
}

variable "subnets" {
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
}
