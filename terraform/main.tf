provider "azurerm"{
  features {}
}

resource "azurerm_resource_group" "rg" {
  name 		= "devops-rg"
  location	= "Central India"
}

resource "azurerm_service_plan" "plan" {
  name			= "devops-plan"
  location		= azurerm_resource_group.rg.location
  resource_group_name	= azurerm_resource_group.rg.name
  os_type		= "Windows"
  sku_name		= "F1"
}

resource "azurerm_windows_web_app" "webapp" {
  name			= "devopswebapp1998"
  location		=azurerm_resource_group.rg.location
  resource_group_name	=azurerm_resource_group.rg.name
  service_plan_id	=azurerm_service_plan.plan.id

  site_config {}
}

