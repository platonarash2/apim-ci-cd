
# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = "e9aac0f0-83bd-43cf-ab35-c8e3eccc8932"

  
}

# create resource group
resource "azurerm_resource_group" "rg" {
    name = "qa-apim"
    location = "northeurope"
}



resource "azurerm_api_management" "apim" {
  name                = "qa-apimarra"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  publisher_email = "arash.rassoulpour@microsoft.com"
  publisher_name = "IT"

  sku_name = "Standard_1"
}


resource "azurerm_api_management_api" "example-terraform-1" {
  name                = "example-terraform-1"
  resource_group_name = azurerm_resource_group.rg.name
  api_management_name = azurerm_api_management.apim.name
  display_name        = "example-terraform-1"
  path                = "example-terraform-1"
  protocols           = ["https"]
  revision = 1

  import {
    content_format = "openapi+json-link"
    content_value  = "https://petstore.swagger.io/v2/swagger.json"
  }
}

resource "azurerm_api_management_api" "example-terraform-2" {
  name                = "example-terraform-2"
  resource_group_name = azurerm_resource_group.rg.name
  api_management_name = azurerm_api_management.apim.name
  display_name        = "example-terraform-2"
  path                = "example-terraform-2"
  protocols           = ["https"]
  revision = 1

  import {
    content_format = "openapi+json-link"
    content_value  = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/examples/v2.0/json/api-with-examples.json"
  }
}

