data "azurerm_key_vault" "kv-cloud46-terraform" {
  name                = "kv-cloud46-terraform"
  resource_group_name = "rg-iacbackend-prod"
}

data "azurerm_key_vault_secret" "cloudflare-api-token" {
  name         = "cloudflare-api-token"
  key_vault_id = data.azurerm_key_vault.kv-cloud46-terraform.id
}