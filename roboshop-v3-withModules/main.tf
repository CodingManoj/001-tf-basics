# Iterating Module is the good thing, rather iterating resource


module "ec2" {
    for_each        = var.components     
   
    source          = "./ec2"
    instance_type   = each.value["instance_type"]
    name            = each.value["name"]
    sgid            = var.sgid
}  