variable "azurerm_resource_group_name" { 
  type = string
  default = "NikRG1" 
  }
variable "location" { 
  type = string 
  default = "Central India"
  }
variable "azurerm_virtual_network" { 
  type = string 
  default = "virtual_network"
  }
variable "address_space" { 
  type = string 
   default = "10.0.0.0/16"

}
variable "azurerm_subnet" {
  type = string 
  default = "SubnetA"
  }
variable "address_prefixes" {
  type    = list(string)
  default = ["10.0.1.0/24"]


}
variable "azurerm_public_ip" {
  type = string 
  default = "public_ip"
  }
variable "azurerm_network_interface" {
  type = string 
  default = "nic1"
  }
  

variable "vm_size" {
  type = string
}

variable "admin_username" {
  type = string
  default = "azureuser"
  
}

variable "admin_password" {
  type = string
  default = "Azurenik@123"
}

variable "azurerm_virtual_machine_name" {
  type = string
  default = "virtual_network"
}













