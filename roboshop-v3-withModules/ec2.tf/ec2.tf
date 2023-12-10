 data "aws_ami" "ami" {
  most_recent       = true
  name_regex        = "DevOps-LabImage-CentOS7"
  owners            = ["355449129696"]
}
 
resource "aws_instance" "instance" {

  ami                       = data.aws_ami.ami.id
  instance_type             = var.instance_type
  vpc_security_group_ids    = var.sgid

  tags = {
        Name       = var.name
    }
}