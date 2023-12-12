provider "aws" {}

variable "test" {
    default = " dev"
}

output "env" {
    value = var.test
}