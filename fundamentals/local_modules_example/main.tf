provider "azurerm" {
    version = "2.20.0"
    features {}
}

module "resource_group" {
    source = "./modules/resourcegroup"
    
    # module custom arguments
    location = var.location
    resource_group_name = var.resource_group_name 
}

resource "azurerm_storage_account" "storage_account" {
    name = var.storage_account_name
    location = var.location
    resource_group_name = module.resource_group.resource_group_name

    account_tier = var.account_tier
    account_replication_type = var.account_replication_type
}

