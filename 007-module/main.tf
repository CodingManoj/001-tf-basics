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
    value   =  value = module.ec2
}