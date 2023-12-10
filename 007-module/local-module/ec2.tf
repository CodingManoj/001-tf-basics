data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "DevOps-LabImage-CentOS7"
  owners      = ["355449129696"]
}

resource "aws_instance" "instance" {
  ami                    = data.aws_ami.ami.id
  instance_type          = var.instance_type
  vpc_security_group_ids = ["sg-052fd946b7e11841a"]
}

variable "instance_type" {}

output "ami" {
  value = data.aws_ami.ami
}

output "private_ip" {
    value   =  aws_instance.instance.private_ip
}

output "private_dns" {
    value   =  aws_instance.instance.private_dns
}