data "azurerm_key_vault" "kv-cloud46-terraform" {
  name                = "kv-cloud46-terraform"
  resource_group_name = "rg-iacbackend-prod"
}

data "azurerm_key_vault_secret" "this" {
  for_each     = toset(local.config.secrets)
  name         = each.key
  key_vault_id = data.azurerm_key_vault.kv-cloud46-terraform.id
}