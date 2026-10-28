terraform {
  required_version = "1.17.0"

  cloud {

    organization = "international-gc-ca"

    workspaces {
      name = "Hands-On_With_Terraform_On_Azure"
    }
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }
}
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "rg" {
  name     = "813-5c249f0f-hands-on-with-terraform-on-azure"
  location = "southcentralus"
}
module "V1" {
  source               = "app.terraform.io/international-gc-ca/V1/training"
  version              = "1.0.2"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "azurermstorage001"
}
