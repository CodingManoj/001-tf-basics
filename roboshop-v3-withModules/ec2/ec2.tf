 data "aws_ami" "ami" {
  most_recent       = true
  name_regex        = "centos7-with-ansible"   # Ensure you use the IMage with Ansible Installed
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

resource "aws_route53_record" "www" {

  depends_on = [aws_instance.instance]

  zone_id  = var.zone_id
  name     = var.name
  type     = "A"
  ttl      = 10
  records  = [aws_instance.instance.private_ip]
}


# App Deploy

# # Installing the applicaiton
# resource "null_resource" "app" {
#   provisioner "remote-exec" {
#     connection {
#       type     = "ssh"
#       user     = local.SSH_USERNAME
#       password = local.SSH_PASSWORD
#       host     = element(local.INSTANCE_PRIVATE_IPS, count.index)
#     }
#     inline = [
#         "sleep 30" , 
#         "ansible-playbook -i ${var.name}-dev.roboshop.internal  -e ansible_user=centos -e ansible_user -e ENV=dev -e COMPONENT=${var.name} roboshop.yml"
#     ]
#   }
# }

# Installing the applicaiton
resource "null_resource" "app" {

  triggers = {
    always_run = "${timestamp()}"                      # This ensure your provisoner would be execuring all the time,
  }

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = aws_instance.instance.private_ip
    }
    inline = [
        "sleep 30",
        "COMPONENT=${var.name}",
        "COMP=$(echo ${var.name} | sed 's/-dev//g')",
        "ansible-pull -U https://github.com/b56-clouddevops/ansible.git -e ENV=dev -e COMPONENT=$COMP -e MYSQL_PSW="RoboShop@1" roboshop-pull.yml"
    ]
  }
}