# expected inputs for remote module
variable "resourcegroupname" {
    default = "tfremoteresourcegroup"
}

variable "location" {
    default = "eastus2"
}

variable "securitygroupname" {
    default = "tfremotensg"
}

variable "securitygrouprules" {
    type = list(object({name = string, priority = string, direction = string, access = string, protocol = string, destination_port_range = string, description = string}))
    default = [
    {
      name = "AllowRDP"
      priority = "100"
      direction = "Inbound"
      access = "Allow"
      protocol = "tcp"
      destination_port_range = "3389"
      description = "Allow RDP"
    }
  ]
}

variable "addressspace" {
    default = ["10.0.0.0/16"]
}

variable "subnetprefixes" {
    type = list(string)
    default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "subnet1" {
    default = "subnet1"
}

variable "subnet2" {
    default = "subnet2"
}


variable "subnetnames" {
    type = list(string)
    default = ["subnet1", "subnet2"]
}
