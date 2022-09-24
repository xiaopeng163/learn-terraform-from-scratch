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

terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-remote-state"
    storage_account_name = "terrafromstate76293"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "terraform_demo" {
  name     = "hello-world"
  location = "West Europe"
}
