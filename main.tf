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

module "static-web-app-1" {
  source = "./modules/static-web-app"

  name = "demosite"
  project = local.project
  environment = local.environment
  region = local.region-alternative
  resource_group = module.resource-group.resource-group-name
}