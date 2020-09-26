# only variables that are output by child module can be accessed from root module
output "resource_group_id" {
    value = module.resource_group.resource_group_id
}

output "resource_group_name" {
    value = module.resource_group.resource_group_name
}

output "storage_account_id_name" {
    value = {
        id = azurerm_storage_account.storage_account.id
        primary_blob_endpoint = azurerm_storage_account.storage_account.primary_blob_endpoint
    }
}