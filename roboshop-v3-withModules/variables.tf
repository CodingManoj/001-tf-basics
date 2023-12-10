variable "sgid" {
    default    = ["sg-052fd946b7e11841a"]
}

variable "zone_id" {
    default    = "Z031297333JO38PNHPROR"
}

variable "components" {
    default = {
        frontend = {
            name          = "frontend-preprod"
            instance_type = "t2.micro"
        }
        mongodb = {
            name          = "mongodb-preprod"
            instance_type = "t2.micro"
        }
        catalogue = {
            name          = "catalogue-preprod"
            instance_type = "t3.micro"
        }     
        redis = {
            name          = "redis-preprod"
            instance_type = "t2.micro"
        }
        mysql = {
            name          = "mysql-preprod"
            instance_type = "t3.medium"
        } 
    }
}