output "app_url" {
  value = "https://${azurerm_static_web_app.secureops.default_host_name}"
}
output "resource_group_name" {
  value = azurerm_resource_group.secureops.name
}
output "static_web_app_name" {
  value = azurerm_static_web_app.secureops.name
}
