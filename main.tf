locals {
  region-primary     = "UK South"
  region-alternative = "westeurope"
  project            = "demo"
  environment        = "demo"
}

module "resource-group" {
  count = 10
  source = "./modules/resource-group"

  project     = local.project
  environment = format("%s-%s",local.environment,count.index)
  region      = local.region-primary
}
