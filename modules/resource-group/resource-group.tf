resource "azurerm_resource_group" "this" {
  name     = format("rg-%s-%s",var.project,var.environment)
  location = var.region
  tags = {
  source = "terraform"
  project = var.project
  environment = var.environment
  }
}