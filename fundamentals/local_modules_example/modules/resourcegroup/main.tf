# Since this is child module and is expceted to be called from another module
# not giving provider reference

resource "azurerm_resource_group" "resource_group" {
    name = var.resource_group_name
    location = var.location
    tags = var.tags
}