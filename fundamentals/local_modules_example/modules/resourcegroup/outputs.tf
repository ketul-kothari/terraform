# This output variables will be available to root module
# values can be accessed using module.module_name.output_variable_name

output "resource_group_id" {
    value = azurerm_resource_group.resource_group.id
}

output "resource_group_name" {
    value = azurerm_resource_group.resource_group.name
}


