variable "ami" {
  default = "ami-0f75a13ad2e340a58"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "sgid" {
  default = "sg-052fd946b7e11841a"
}

variable "components" {
    default = {
        cart        = { name = "cart-qa" }
        catalogue   = { name = "catalogue-qa" },
        payment     = { name = "payment-qa" },
        shipping    = { name = "shipping-qa" },
        dispatch    = { name = "dispatch-qa" },

    }
}

resource "aws_instance" "instance" {
  for_each         = var.components  

  ami              = var.ami 
  instance_type    = var.instance_type

  tags = {
        Name       = lookup(each.value, "name", null)
   }
}

output "instances" {
    value = aws_instance.instance
}



resource "aws_security_group" "sg" {
  for_each = var.components
  name     = lookup(var.components, each.value["name"], null)
}
