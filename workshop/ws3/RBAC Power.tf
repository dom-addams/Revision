resource "azurerm_role_definition" "vm_power_role" {
  name        = "Virtual Machine Power Management"
  description = "Allows starting and stopping virtual machines."

  permissions {
    actions = [
      "Microsoft.Compute/*/read",
      "Microsoft.Compute/virtualMachines/start/action",
      "Microsoft.Compute/virtualMachines/restart/action",
      "Microsoft.Compute/virtualMachines/powerOff/action"
    ]
  }

  assignable_scopes = [azurerm_subscription.primary.id]
}

resource "azurerm_role_assignment" "vm_power_assignment" {
  scope              = azurerm_subscription.primary.id
  role_definition_id = azurerm_role_definition.vm_power_role.id
  principal_id       = data.azurerm_active_directory_group.vm_operators.object_id
}

data "azurerm_active_directory_group" "vm_operators" {
  name = azurerm_azuread_group.vm_power_group.name
}

resource "azurerm_azuread_group" "vm_power_group" {
  name        = "vm-operators"
  description = "Security group to allow power on and off for virtual machines"

  # Add additional properties if needed
}
