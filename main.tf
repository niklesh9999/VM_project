terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"

    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}


module "azurerm_resource_group" {
    source = "./demo-module/azurerm_resource_group"
    azurerm_resource_group = var.azurerm_resource_group_name
    location = var.location
  
}

module "azurerm_virtual_network" {
  depends_on = [ module.azurerm_resource_group ]
  source = "./demo-module/azurerm_virtual_network"
  resource_group_name = var.azurerm_resource_group_name
  location = var.location
  azurerm_virtual_network = var.azurerm_virtual_network
  address_space = var.address_space
  
}

module "azurerm_subnet" {
  depends_on = [ module.azurerm_virtual_network ]
  source = "./demo-module/azurerm_subnet"
  azurerm_resource_group_name = var.azurerm_resource_group_name 
  azurerm_subnet = var.azurerm_subnet
  virtual_network_name = var.azurerm_virtual_network
  address_prefixes = var.address_prefixes
  
}

module "azurerm_public_ip" {
  depends_on = [ module.azurerm_resource_group ]
  source = "./demo-module/azurerm_public_ip"
  azurerm_resource_group_name = var.azurerm_resource_group_name
  location = var.location
  azurerm_public_ip = var.azurerm_public_ip
  
}

module "nic" {
  depends_on = [ module.azurerm_subnet ]
  source = "./demo-module/azurerm_nic"
  azurerm_network_interface = var.azurerm_network_interface
  azurerm_resource_group_name = var.azurerm_resource_group_name
  location = var.location
  azurerm_subnet_id = module.azurerm_subnet.azurerm_subnet
  azurerm_public_ip_id = module.azurerm_public_ip.azurerm_public_ip

    
  }

  module "azurerm_linux_virtual_machine" {
    depends_on = [ module.azurerm_virtual_network ]
    source = "./demo-module/azurerm_virtual_linux_machine"
    azurerm_virtual_linux_machine_name = var.azurerm_virtual_linux_machine_name
    azurerm_resource_group_name = var.azurerm_resource_group_name
    location = var.location
    vm_size = var.vm_size
    admin_password = var.admin_password
    admin_username = var.admin_username
    azurerm_network_interface_id = module.nic.nic
    
  }
    
