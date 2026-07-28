resource "azurerm_subnet" "azurerm_subnet" {
  name                 = var.azurerm_subnet
  resource_group_name  = var.azurerm_resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_prefixes
}
