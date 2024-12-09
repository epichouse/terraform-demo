resource "azurerm_key_vault_secret" "this" {
  name         = var.secret_name
  value        = var.secret_value
  key_vault_id = var.key_vault_id
  expiration_date = "2099-01-01T00:00:00Z"
}