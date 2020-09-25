provider "azurerm" {
    version = "2.20.0"
    features {}
}

variable "rgmap" {
    default = {
        rg_eastus = "eastus"
        rg_eastus2 = "eastus2"
    }
}

# for_each argument accepts either set or map
# An alternative for count when more control is needed
# each can be used to access key and value of map & in case of set only key can be used
# values can be accessed later using: azurerm_resource_group.resourcegroups["rg_eastus2"] - keys in map
resource "azurerm_resource_group" "resourcegroups" {
    for_each = var.rgmap
    name = each.key
    location = each.value
} 

output "rgeastus" {
    value = azurerm_resource_group.resourcegroups["rg_eastus"]
}

output "rgeastus2" {
    value = azurerm_resource_group.resourcegroups["rg_eastus2"]
}