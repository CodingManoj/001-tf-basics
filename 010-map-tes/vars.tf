variable "vpc" {
    default = {
        main = {
            cidr = "10.0.0.0/16"
            subnets = {
                public = {
                    public1 = { cidr = "10.0.0.0/24" , az = "us-east1-a"}
                    public2 = { cidr = "10.0.1.0/24" , az = "us-east1-b"}
                }
                app = {
                    app1 = { cidr = "10.0.2.0/24" , az = "us-east1-a"}
                    app2 = { cidr = "10.0.3.0/24" , az = "us-east1-b"}
                }
                db = {
                    db1 = { cidr = "10.0.4.0/24" , az = "us-east1-a"}
                    db1 = { cidr = "10.0.5.0/24" , az = "us-east1-b"}
                }
            }
        }
    }
}

output "subnets" {
    value = merge(var.vpc["main"]["subnets"])
}