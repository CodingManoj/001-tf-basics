# Looping Moudles is the best thing, rather resources

module "instances" {
    for_each        = var.components
   
    source          = "./ec2"
    instance_type   = each.value["instance_type"]
    name            = each.value["name"]
    sgid            = var.sgid
    zone_id         = var.zone_id    
    MYSQL_PSW       = var.MYSQL_PSW
}  

# module "instances" {
#     source         = "./ec2"
# }
