resource "azurerm_resource_group" "example" {
  name     = "terraform-resources-rg"
  location = "UK South"
}

resource "azurerm_windows_virtual_machine" "advanced_vm" {
  name                = "tf-vm"
  resource_group_name = azurerm_resource_group.example.name
  location            = "UK South"
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.advanced_nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_virtual_machine_extension" "vm_extension_install_iis" {
  name                       = "vm_extension_install_iis"
  virtual_machine_id         = azurerm_windows_virtual_machine.advanced_vm.id
  publisher                  = "Microsoft.Compute"
  type                       = "CustomScriptExtension"
  type_handler_version       = "1.8"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
    {
        "commandToExecute": "powershell -ExecutionPolicy Unrestricted Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature -IncludeManagementTools"
    }
SETTINGS
}

## UPDATE SCHEDULE ##

# Scheduled Updates to run at 3AM GMT/UTC weekly on Sundays
resource "azurerm_virtual_machine_extension" "backup_schedule" {
  name                 = "update-config"
  virtual_machine_id   = azurerm_windows_virtual_machine.advanced_vm.id
  publisher            = "Microsoft.Compute"
  type                 = "WindowsUpdateAgent"
  type_handler_version = "2.0"

  settings = <<SETTINGS
    {
      "settings": {
        "windowsUpdate": {
          "automaticReboots": true,
          "category": "All",
          "excludedKbNumbers": [],
          "includedUpdateClassifications": [
            "CriticalUpdates",
            "SecurityUpdates",
            "DefinitionUpdates"
          ],
          "installDuration": 60,
          "rebootSetting": "IfRequired"
        },
        "scheduledTasks": [
          {
            "taskName": "backup-task",
            "description": "Weekly backup at 3 AM on Sundays",
            "actions": [
              {
                "type": "ExecutePowerShellScript",
                "executePowerShellScriptArguments": {
                  "script": "Set-AzRecoveryServicesBackupSchedule -PolicyObject (Get-AzRecoveryServicesBackupProtectionPolicy -Name <policy_name> -ResourceGroupName <policy_resource_group>).Properties.SchedulePolicy -DailyRetentionForHrs 24 -DailyRetentionForDays 30 -WeeklyRetentionForWeeks 4 -WeeklyRetentionFormat 'Sun' -RetentionDurationForMonths 12 -StartTime 03:00:00 -Force"
                }
              }
            ],
            "triggers": [
              {
                "type": "Weekly",
                "weekDays": [
                  "Sunday"
                ],
                "startBoundary": "2022-01-01T03:00:00Z",
                "executionTimeLimit": "PT1H"
              }
            ],
            "settings": {
              "executionTimeLimit": "PT1H",
              "maxRunTime": "PT1H",
              "priority": 5,
              "runElevated": true,
              "idleSettings": {
                "stopOnIdleEnd": true,
                "restartOnIdle": false
              }
            }
          }
        ]
      }
    }
SETTINGS
}


## RECOVERY POLICY ##

resource "azurerm_recovery_services_vault" "my_recovery" {
  name                = "temp-recovery-vault"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "Standard"
}

# # Back policy to run at 3AM GMT/UTC weekly on Sundays
resource "azurerm_backup_policy_vm" "example" {
  name                = "temp-recovery-vault-policy"
  resource_group_name = azurerm_resource_group.example.name
  recovery_vault_name = azurerm_recovery_services_vault.my_recovery.name

  timezone = "UTC"

  backup {
    frequency = "Weekly"
    time      = "03:00"
    weekdays  = ["Sunday"]
  }

  retention_weekly {
    count    = 3 # number of weekly backups to keep
    weekdays = ["Sunday", "Wednesday", "Friday"]
  }

}