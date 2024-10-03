resource "humanitec_application" "backstage" {
  id   = "backstage"
  name = "backstage"
}

locals {
  secrets = {
    humanitec-token          = var.humanitec_ci_service_user_token
    github-app-client-id     = var.github_app_client_id
    github-app-client-secret = var.github_app_client_secret
    github-app-private-key   = indent(2, var.github_app_private_key)
    github-webhook-secret    = var.github_webhook_secret
  }

  secret_refs = {
    for key, value in local.secrets : key => {
      value = value
    }
  }
}

module "portal_backstage" {
  source = "github.com/ltim-de/shared-terraform-modules/modules/portal-backstage"

  cloud_provider = "gcp"

  humanitec_org_id                    = var.humanitec_org_id
  humanitec_app_id                    = humanitec_application.backstage.id
  humanitec_ci_service_user_token_ref = local.secret_refs["humanitec-token"]

  github_org_id                = var.github_org_id
  github_app_client_id_ref     = local.secret_refs["github-app-client-id"]
  github_app_client_secret_ref = local.secret_refs["github-app-client-secret"]
  github_app_id                = var.github_app_id
  github_app_private_key_ref   = local.secret_refs["github-app-private-key"]
  github_webhook_secret_ref    = local.secret_refs["github-webhook-secret"]
}

# Configure required resources for backstage

locals {
  res_def_prefix = "backstage-"
}

# in-cluster postgres

module "backstage_postgres" {
  source = "github.com/ltim-de/resource-packs-in-cluster/humanitec-resource-defs/postgres/basic"

  prefix = local.res_def_prefix
}

# in-cluster redis

module "backstage_redis" {
  source = "github.com/ltim-de/resource-packs-in-cluster/humanitec-resource-defs/redis/basic"

  prefix = local.res_def_prefix
}


resource "humanitec_resource_definition_criteria" "backstage_postgres" {
  resource_definition_id = module.backstage_postgres.id
  app_id                 = humanitec_application.backstage.id

  force_delete = true
}

resource "humanitec_resource_definition_criteria" "backstage_redis" {
  resource_definition_id = module.backstage_redis.id
  app_id                 = humanitec_application.backstage.id

  force_delete = true
}
