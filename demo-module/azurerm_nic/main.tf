resource "azurerm_network_interface" "nic" {
  name                = var.azurerm_network_interface
  location            = var.location
  resource_group_name = var.azurerm_resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.azurerm_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = var.azurerm_public_ip_id
  }
}