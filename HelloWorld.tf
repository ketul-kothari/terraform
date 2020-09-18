variable "myvar" {
    type = string
    default = "Hello Terraform"
}

variable "mymap" {
    type = map(string)
    default = {
        "mykey" = "myvalue"
    }
}

variable "mylist" {
    type = list(string)
    default = [
        "value 1",
        "value 2"
    ]
}

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

variable "myobject" {
    type = object({name=string, identity=string})
    default = {
        name : "Bruce"
        identity : "Batman"
    }
}

