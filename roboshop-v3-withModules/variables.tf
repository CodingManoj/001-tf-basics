variable "sgid" {
    default    = ["sg-052fd946b7e11841a"]
}

variable "zone_id" {
    default    = "Z031297333JO38PNHPROR"
}

variable "components" {
  default = {
    cart = {
      name          = "cart-prod"
      instance_type = "t3.micro"
    }
    mongodb = {
      name          = "mongodb-prod"
      instance_type = "t3.micro"
    }
    catalogue = {
      name          = "catalogue-prod"
      instance_type = "t3.micro"
    }
    user = {
      name          = "user-prod"
      instance_type = "t3.micro"
    }
    redis = {
      name          = "redis-prod"
      instance_type = "t3.micro"
    }
    mysql = {
      name          = "mysql-prod"
      instance_type = "t3.micro"
    }
    payment = {
      name          = "payment-prod"
      instance_type = "t3.micro"
    }
    shipping = {
      name          = "shipping-prod"
      instance_type = "t3.micro"
    }
    rabbitmq = {
      name          = "rabbitmq-prod"
      instance_type = "t3.micro"
    }
    frontend = {
      name          = "frontend-prod"
      instance_type = "t3.micro"
    }
  }
}