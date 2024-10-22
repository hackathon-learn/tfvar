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
  }
}

provider "azurerm" {
  features {}
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
