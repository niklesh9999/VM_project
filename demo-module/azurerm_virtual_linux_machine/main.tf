resource "azurerm_linux_virtual_machine" "azurerm_virtual_linux_machine" {
  name                = var.azurerm_virtual_linux_machine_name
  computer_name       = "vm1"

  resource_group_name = var.azurerm_resource_group_name
  location            = var.location
  size                = var.vm_size

  admin_username = var.admin_username
  admin_password = var.admin_password

  disable_password_authentication = false

  network_interface_ids = [
    var.azurerm_network_interface_id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}