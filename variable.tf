variable "azurerm_resource_group_name" { type = string }
variable "location" { type = string }
variable "azurerm_virtual_network" { type = string }
variable "address_space" { 
  type = string 
   default = "10.0.0.0/16"

}
variable "azurerm_subnet" {type = string }
variable "address_prefixes" {
  type    = list(string)
  default = ["10.0.1.0/24"]


}
variable "azurerm_public_ip" {type = string }
variable "azurerm_network_interface" {type = string }
  

variable "vm_size" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type = string
}

variable "azurerm_virtual_machine_name" {
  type = string
}


variable "subscription_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string

}

variable "tenant_id" {
  type = string








}
