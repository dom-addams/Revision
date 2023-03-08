resource "azurerm_role_definition" "vm_metrics_role" {
  name        = "Virtual Machine Metrics Reader"
  description = "Allows viewing virtual machine metrics."

  permissions {
    actions = [
      "Microsoft.Compute/*/read",
      "Microsoft.Insights/metrics/read"
    ]
  }

  assignable_scopes = [azurerm_subscription.primary.id]
}

resource "azurerm_role_assignment" "vm_metrics_assignment" {
  scope              = azurerm_subscription.primary.id
  role_definition_id = azurerm_role_definition.vm_metrics_role.id
  principal_id       = data.azurerm_active_directory_group.vm_readers.object_id
}

data "azurerm_active_directory_group" "vm_readers" {
  name = azurerm_azuread_group.vm_readers_group.name
}

resource "azurerm_azuread_group" "vm_readers_group" {
  name        = "vm-readers"
  description = "Security group to allow read access to virtual machines"

  # Add additional properties if needed
}
