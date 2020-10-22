# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.20.0"
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "irek-example" {
  name     = "irek-example-resources"
  location = "West Europe"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "irek-example" {
  name                = "irek-example-network"
  resource_group_name = azurerm_resource_group.irek-example.name
  location            = azurerm_resource_group.irek-example.location
  address_space       = ["10.0.0.0/16"]
}
