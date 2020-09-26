# below variables don't have default set which means user must provide values
variable "location" {
    type = string
    description = "location where the resource group is to be hosted"
}

variable "resource_group_name" {
    type = string
    description = "Name of Resource group"
}

# providing default value which means user does not need to provide it necessarily
variable "tags" {
    default = {}
}