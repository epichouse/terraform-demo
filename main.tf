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
