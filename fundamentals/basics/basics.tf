# decalre variable with name myvar
variable "myvar" {
    type = string
    default = "Hello Terraform"
}
# var.myvar

# declare map (key value pair with name mymap)
variable "mymap" {
    type = map(string)
    default = {
        "mykey" = "myvalue"
    }
}
# var.mymap
# var.mymap.mykey


variable "mylist" {
    type = list(string)
    default = [
        "value 1",
        "value 2"
    ]
}
# var.mylist
# var.mylist[0]
# element(var.mylist, 0)
# slice(var.mylist, 0, 2)


// won't contain duplicate values once created .. will automatically be sorted
variable "myset" {
    type = set(number)
    default = [
        8,
        1,
        4,
        4
    ]
}
# var.myset
# indices not supported

variable "myobject" {
    type = object({name=string, identity=string})
    default = {
        name : "Bruce"
        identity : "Batman"
    }
}

variable "mybool" {
    default = true
}


variable "mytuple" {
    type = tuple([string, number, bool])
    default = ["value 1", 2, true]
}


# input variable
# Value of this vaiables are requested on console on terraform apply
# to avoid prompt the input variables can be passed as command params 
# terraform apply -var 'inputmystring=test' -var 'inputmystring_test=test2'
variable "inputmystring" {
    type = string
    description = "Enter resource name"
}




# output 
# the values are printed on console post apply
# to view explicitly use terraform output resourcegroupid
/*
output "resourcegroupid" {
    value = azurerm_resource_group.demorg.id
}
*/

#var.myobject
# var.myobject.name

# resource create format
/*
resource "resource-type (provider)" "terraform_name" {
    ... cloud provider properties
}
*/

#terraform show - to get details from state file

# terraform state - to perform ops on state

# Block syntax
/*
BlockType <Block lable>...<Block label> {
	Arguments
	name = value (string, number, object, map, tuple)
	.
	.
	Blocks
	.
	.
}
*/