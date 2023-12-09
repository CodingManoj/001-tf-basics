variable "components" {
    default = ["frontend" , "catalogue"]
}

resource "aws_instance" "instance" {
  count         = length(var.components)

  ami           = "ami-0f75a13ad2e340a58"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}