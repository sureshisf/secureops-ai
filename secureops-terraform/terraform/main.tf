terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = { source = "hashicorp/azurerm", version = "~> 4.0" }
  }
}
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}
resource "azurerm_resource_group" "secureops" {
  name     = var.resource_group_name
  location = var.location
  tags     = { environment = "prototype", application = "secureops-ai" }
}
resource "azurerm_static_web_app" "secureops" {
  name                = var.app_name
  resource_group_name = azurerm_resource_group.secureops.name
  location            = var.location
  sku_tier            = "Free"
  sku_size            = "Free"
  tags                = azurerm_resource_group.secureops.tags
}
