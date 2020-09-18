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
#var.myobject
# var.myobject.name

