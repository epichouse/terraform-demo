provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

locals {
  region-primary     = "UK South"
  region-alternative = "westeurope"
  project            = "demo"
  environment        = "demo"
}

module "resource-group" {
  source = "./modules/resource-group"

  project     = local.project
  environment = local.environment
  region      = local.region-primary
}
