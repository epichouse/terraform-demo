output "deployment-token" {
  description = ""
  value = azurerm_static_web_app.this.api_key
}

output "default-domain" {
  description = ""
  value = azurerm_static_web_app.this.default_host_name
}

output "static_web_app_id" {
  description = ""
  value = azurerm_static_web_app.this.id
}