resource "azurerm_key_vault" "this" {
  name                        = format("kv-%s-%s",var.project,var.environment)
  location                    = var.region
  resource_group_name         = var.resource_group
  enabled_for_disk_encryption = false
  tenant_id                   = "708a0e9d-63e1-400f-bbd8-de768ec8a3c8"
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  enable_rbac_authorization   = false
  sku_name = "standard"
    tags = {
  source = "terraform"
  project = var.project
  resourcetype = "backend"
  environment = var.environment
  }
  access_policy {
    tenant_id = "708a0e9d-63e1-400f-bbd8-de768ec8a3c8"
    object_id = "f976b8ce-c5e3-4be2-984e-ffe17704e9a9"

    secret_permissions = [
      "Get", "List", "Set", "Delete", "Purge", "Recover", "Backup", "Restore"
    ]
  }
  access_policy {
    tenant_id = "708a0e9d-63e1-400f-bbd8-de768ec8a3c8"
    object_id = "a5ec818b-a415-438b-a88c-197d7c45d2fd"

    secret_permissions = [
      "Get", "List", "Set", "Delete", "Purge", "Recover", "Backup", "Restore"
    ]
  }
  access_policy {
    tenant_id = "708a0e9d-63e1-400f-bbd8-de768ec8a3c8"
    object_id = "0e3f90f8-547f-48b1-92a1-b5c216ea7055"

    secret_permissions = [
      "Get", "List", "Set", "Delete", "Purge", "Recover", "Backup", "Restore"
    ]
  }
}