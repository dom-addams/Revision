terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}


resource "azurerm_storage_account" "all_storage" {
  name                     = "allmytfstorage123"
  resource_group_name      = "aks-proving-rg"
  location                 = "UK South"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}