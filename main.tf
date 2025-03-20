terraform {
  required_providers {
    snowflake = {
      source = "Snowflake-Labs/snowflake"
    }
  }
}

# A simple configuration of the provider with a default authentication.
# A default value for `authenticator` is `snowflake`, enabling authentication with `user` and `password`.
#provider "snowflake" {
#  organization_name = "VOLVOCARS" # required if not using profile. Can also be set via SNOWFLAKE_ORGANIZATION_NAME env var
#  account_name      = "SANDBOX" # required if not using profile. Can also be set via SNOWFLAKE_ACCOUNT_NAME env var
#  user              = "SBX_EDWSINK_ADMIN_USR" # required if not using profile or token. Can also be set via SNOWFLAKE_USER env var
#  password          = "96754YjDChTVX9s"
#  preview_features_enabled = ["snowflake_database_datasource","snowflake_storage_integration_resource","snowflake_stage_resource"]
#  warehouse = "DEV_ADMIN_ANALYST_WHS"
#  role      = "CLD-SNOWFLAKE-SANDBOX-DEV-ADMIN-DEVOPS-SG"
#}



#Dummy object
resource "snowflake_database" "primary" {
  name = var.database_name
}

resource "snowflake_storage_integration" "integration" {
  name    = var.storage_integration_name
  comment = var.sti_comment
  type    = var.sti_type
  enabled = true
  storage_allowed_locations = [var.storage_allowed_locations]
  storage_provider         = var.storage_provider
  azure_tenant_id = "81fa766e-a349-4867-8bf4-ab35e250a08f"
}


#resource "snowflake_stage" "stage_edwsink" {
#  name        = var.snowflake_stage_name
#  url         = var.snowflake_stage_url
#  database    = var.snowflake_stage_database
#  schema      = var.snowflake_stage_schema
#  storage_integration = var.snowflake_stage_storage_integration
#}

variable "database_name" {
  type = string
}

variable "storage_integration_name" {
  type = string
}

variable "storage_allowed_locations" {
  type = string
}

variable "storage_provider" {
  type = string
}

variable "sti_type" {
  type = string
}

variable "sti_comment" {
  type = string
}

variable "snowflake_stage_name" {
  type = string
}

variable "snowflake_stage_url" {
  type = string
}

variable "snowflake_stage_database" {
  type = string
}

variable "snowflake_stage_schema" {
  type = string
}

variable "snowflake_stage_storage_integration" {
  type = string
}