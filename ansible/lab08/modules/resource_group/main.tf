# Create a resource group 
resource "azurerm_resource_group" "rg_group" {
  name     = var.rg_group_name
  location = var.location
}
