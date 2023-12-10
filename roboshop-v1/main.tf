# variable "components" {
#     default = ["mongogd" , "frontend" , "catalogue"]
# }


variable "components" {
    default = {
        cart = {
            name = "cart-sg"
        },
        catalogue = {
            name = "catalogue-sg"
        },
        mongo = {
            name = "mongo-sg"
        },
    }
}

# resource "aws_instance" "instance" {
#   count         = length(var.components)

#   ami           = "ami-0f75a13ad2e340a58"
#   instance_type = "t2.micro"

#   tags = {
#     Name = element(var.components, count.index)
#   }
# }


# resource "aws_security_group" "sg" {
#   count = length(var.components)
#   name  = element(var.components, count.index)
# }



resource "aws_security_group" "sg" {
  for_each = var.components
  name     = lookup(var.components, each.value["name"], null)
}
