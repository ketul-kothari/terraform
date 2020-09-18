# add azure rm as provider
provider "azurerm" {
    version = "2.20.0"
    features {}
}

# create resource group
# demorg is terraform variable name
# tfresourcegroup is resource group name in azure
resource "azurerm_resource_group" "demorg" {
    name = "tfresourcegroup"
    location = var.location
    tags = {
        env = "demo"
    }
}