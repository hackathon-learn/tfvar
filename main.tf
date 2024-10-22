terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "nirmalhack"
    storage_account_name = "tfstatestg20244"
    container_name       = "state" //Create this by running Foundation if its a new RG
    key                  = "terraform.tfstate"
    client_id            = "8f34d4c4-3879-42f8-864b-94832b5ebe86"
    client_secret        = "keU8Q~MGRbMIiSkMl_qJ2ZUnU.89Q3J3y2zCKajQ"
    tenant_id            = "542b1027-72dc-4685-8674-175655720883"
    subscription_id      = "a43dc29c-198c-4dd1-80b2-eec3342b1d35"
  }
}

provider "azurerm" {
  features {}
  client_id       = "8f34d4c4-3879-42f8-864b-94832b5ebe86"
  client_secret   = "keU8Q~MGRbMIiSkMl_qJ2ZUnU.89Q3J3y2zCKajQ"
  tenant_id       = "542b1027-72dc-4685-8674-175655720883"
  subscription_id = "a43dc29c-198c-4dd1-80b2-eec3342b1d35"
}

variable "rg_name" {
  type    = string
  default = "nrimaltemprg001"
}

variable "rg_location" {
  type    = string
  default = "eastus"
}

resource "azurerm_resource_group" "rg1" {
  name     = var.rg_name
  location = var.rg_location
}