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

resource "null_resource" "app_deploy" {

  depends_on = [
    aws_route53_record.www
  ]

  provisioner "local-exec" {
    command = <<EOF
cd /home/centos/ansible
git pull
sleep 10
ansible-playbook -i ${var.name}-prod.roboshop.internal -e ENV=prod -e ansible_user=centos -e ansible_password=DevOps321 -e COMPONENT=${var.name} run.yml 
EOF
  }
}