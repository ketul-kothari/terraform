provider "azurerm" {
    version = "2.20.0"
    features {}
}

# count is useful when identical resources are to be created
# count argument specifies number of resources to be created for the given resource block.
# count.index can be used inside resource block to access index (starts from 0)
# Resource block can be accessed using : azurerm_resource_group.resourcegroups
# Individual resource can be accessed using: azurerm_resource_group.resourcegroups[0]
resource "azurerm_resource_group" "resourcegroups" {
    count = 2
    name = "tfrg${count.index}"
    location = var.location
}

output "resourcegroupid_0" {
    value = azurerm_resource_group.resourcegroups[0].id
}

output "resourcegroupid_1" {
    value = azurerm_resource_group.resourcegroups[1].id
}