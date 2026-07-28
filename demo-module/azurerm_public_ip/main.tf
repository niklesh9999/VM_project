resource "azurerm_public_ip" "azurerm_public_ip" {
  name                = var.azurerm_public_ip
  resource_group_name = var.azurerm_resource_group_name
  location            = var.location
  allocation_method   = "Static"
}