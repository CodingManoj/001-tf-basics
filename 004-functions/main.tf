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


# So, we need to handle these exceptions
# output "fruit_stocks" {
#     value = var.fruits_with_stock["pineapple"]   # reports error as you're trying to print something that's not there. 
# }



# If you're not able to find the value, report default value . . . and that can be done using functions 
# try can be used 

output "fruit_stocks" {
    value = try(var.fruits_with_stock["pineapple"], 0)   #since pineapple is not defined, it takes default value as 0
}


# Map of maps 



variable "fruits_and_stock" {
    default = {
        apple = {
            price = 100 
            size = "medium"
        }
    }
}

output "fruits_and_stock_price" {
    value = try(var.fruits_and_stock["apple"].price, 0)
}

output "fruits_and_stock_place" {
    value = try(var.fruits_and_stock["apple"].place, "DontKnow")   # Since the place is not defined it reports default value   
}