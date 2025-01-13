resource "azurerm_static_web_app" "this" {
  name                = format("app-%s-%s-%s",var.project,var.name,var.environment)
  resource_group_name = var.resource_group
  location                 = var.region
  sku_tier = "Free"
  tags = {
  source = "terraform"
  project = var.project
  resourcetype = "frontend"
  environment = var.environment
  }
}