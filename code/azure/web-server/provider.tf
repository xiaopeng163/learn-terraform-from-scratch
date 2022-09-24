terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.23.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.1"
    }
    template = {
      source  = "hashicorp/template"
      version = "~> 2.2.0"
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
