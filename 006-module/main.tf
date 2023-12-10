variable "instance_type" {
    default = "t2.micro"
}

module "ec2" {
    source          = "./local-module"
    instance_type   = var.instance_type
}

output "ami" {
    # value = module.ec2    # Prints all the outputs related to ec2 module
    value = module.ec2.ami    # prints only AMI output
}

output "private_ip" {
    value   = module.ec2.private_ip
    # value   = module.ec2.
}

output "private_dns" {
    # value   = module.ec2.private_dns
    value   = module.ec2.private_dns
}