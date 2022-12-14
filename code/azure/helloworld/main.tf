terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.23.0"
    }
    akamai = {
      source  = "carnei-ro/akamai"
      version = "1.4.0"
    }
  }
}

provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "terraform_demo" {
  name     = "hello-world"
  location = "West Europe"
}
