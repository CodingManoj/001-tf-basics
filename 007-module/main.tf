variable "instance_type" {
    default = "t2.micro"
}

module "ec2" {
    source          = "./local-module"
    instance_type   = var.instance_type
}

output "ami" {
    value = module.ec2
}

output "private_ip" {
    value   = module.ec2
}

output "private_dns" {
    value   = module.ec2
}