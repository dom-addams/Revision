variable "rg_name" {}
variable "location" {}

resource "azurerm_resource_group" "example" {
  name     = var.rg_name
  location = var.location
}

output "rg_name_output" {
  value = azurerm_resource_group.example.name
}

output "rg_location_output" {
  value = azurerm_resource_group.example.location
}
