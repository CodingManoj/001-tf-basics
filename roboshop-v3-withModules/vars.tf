variable "sgid" {
    default    = ["sg-052fd946b7e11841a"]
}

variable "zoneid" {
    default    = "Z031297333JO38PNHPROR"
}

variable "components" {
    default = {
        frontend = {
            name          = "frontend"
            instance_type = "t2.micro"
        }
        mongodb = {
            name          = "mongodb"
            instance_type = "t2.micro"
        }
        catalogue = {
            name          = "catalogue"
            instance_type = "t3.micro"
        }     
        redis = {
            name          = "redis"
            instance_type = "t2.micro"
        }
        mysql = {
            name          = "mysql"
            instance_type = "t3.medium"
        } 
    }
}