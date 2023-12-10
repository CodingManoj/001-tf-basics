variable "components" {
  default = ["catalogue", "frontend", "mongodb"]
}

# If there is any change in the input order you would see catastrophy
resource "aws_security_group" "allow_tls" {
  count = length(var.components)
  name  = element(var.components, count.index)
}