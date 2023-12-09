variable "fruits" {
    default = [ "apple" , "pineapple" ]
}

# works
# output "fruits_op" {
#     value = var.fruits[1]
# }

# But this throws as error, index out of exception, that's where functions help
# output "fruits_op" {
#     value = var.fruits[2]
# }

output "fruits_op" {
    # value = var.fruits[2]
    # value =  element(var.fruits,1 ) # works
    value =  element(var.fruits,2)    # cycling will happend and will switch back to 0 and counts from 0
}


variable "fruits_with_stock" {
    default = {
        apple = 100
    }
}

output "fruit_stock" {
    value = var.fruits_with_stock["apple"]   # prints 100 
}

output "fruit_stocks" {
    value = var.fruits_with_stock["pineapple"]   # reports error as you're trying to print something that's not there. 
}