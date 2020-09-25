provider "azurerm" {
    version = "2.20.0"
    features {}
}

resource "azurerm_resource_group" "demorg" {
    name = "tfresourcegroup"
    location = var.location
    tags = {
        env = "demo"
    }
}

resource "azurerm_network_security_group" "demonsg" {
    name = "tfnsg"
    location = var.location
    resource_group_name = azurerm_resource_group.demorg.name
}

resource "azurerm_virtual_network" "demovnet" {
    name = "tfvnet"
    location = var.location
    resource_group_name = azurerm_resource_group.demorg.name
    address_space = ["10.0.0.0/16"]
    subnet {
        name = "demosubnet1"
        address_prefix = "10.0.1.0/24"
        security_group = azurerm_network_security_group.demonsg.id
    }
    subnet {
        name = "demosubnet2"
        address_prefix = "10.0.2.0/24"
        security_group = azurerm_network_security_group.demonsg.id
    }
}

