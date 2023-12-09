variable "fruits" {
    default = [ "apple" , "pineapple" ]
}

output "fruits_op" {
    value = var.fruits
}