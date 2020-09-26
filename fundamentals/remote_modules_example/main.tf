provider "azurerm" {
    version = "2.20.0"
    features {}
}

# Module is a directory containing tf files.
# The directory from which terraform command is executed becomes root directory.
# Terraform registry contains details about providers and commonly available modules.
# Remote modules are downloaded to .terraform/modules on terraform init or terraform get.
# Local modules are added via link so any changes in local modules are reflected immediately.
# access output from modules in dependent configuration as module.module_name.output_variable_name

resource "azurerm_resource_group" "resourcegroup" {
    name = var.resourcegroupname
    location = var.location
}

# terrform registry module
module "network-security-group" {
  source  = "Azure/network-security-group/azurerm"
  version = "3.3.1"
  
  resource_group_name = azurerm_resource_group.resourcegroup.name

  location = var.location
  security_group_name = var.securitygroupname
  custom_rules = var.securitygrouprules

  # dependency is not getting auto detected from expression .. so using depends_on
  depends_on = [azurerm_resource_group.resourcegroup]
}

# terraform registry module
module "vnet" {
  source = "Azure/vnet/azurerm"

  resource_group_name = azurerm_resource_group.resourcegroup.name

  address_space = var.addressspace
  subnet_prefixes = var.subnetprefixes
  subnet_names = var.subnetnames

  nsg_ids = {
      "${var.subnet1}" = module.network-security-group.network_security_group_id
      "${var.subnet2}" = module.network-security-group.network_security_group_id
  }

  # dependency is not getting auto detected from expression .. so using depends_on
  depends_on = [azurerm_resource_group.resourcegroup]
}