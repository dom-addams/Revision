resource "azurerm_virtual_network" "main_vnet" {
  name                = var.vnet_name 
  location            = var.vnet_location
  resource_group_name = var.rg
  address_space       = var.vnet_range
}

resource "azurerm_subnet" "internal_subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.rg
  virtual_network_name = azurerm_virtual_network.main_vnet.name
  address_prefixes     = var.subnet_range
}

output "subnet_id_output" {
  value = azurerm_subnet.internal_subnet.id
}
