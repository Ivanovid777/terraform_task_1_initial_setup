terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.105.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "test-terraform" {
  name     = "test-terraform-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "store-for-terraform" {
  name                     = "examplestorageacc"
  resource_group_name      = azurerm_resource_group.test-terraform.name
  location                 = azurerm_resource_group.test-terraform.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
