variable "common_tags" {
    default = {
        Project = "roboshop"
        Environment = "dev"
        Terraform = "true"
    }
}

variable "environment" {
  description = "The environment for the deployment"
  type        = string
  default     = "dev"

}

variable "project" {
  description = "The project name for the deployment"
  type        = string
  default     = "roboshop"

}

variable "ami_id" {
  type    = string
  default = "ami-0055977a6e828a4f4"
  description = "The AMI ID for the EC2 instance"
}

variable "instance_type" {
  type    = string  
  default ="t3.micro"
  description = "The instance type for the EC2 instance"

  validation {
  # Returns true if var.instance_type is one of the allowed values, otherwise returns false
    condition     = contains(["t3.small", "t3.medium", "t3.micro", "t3.large"], var.instance_type)
    error_message = "The instance type must be one of: t3.small, t3.medium, t3.micro, t3.large."
  }
}

variable "instances_type" {
  type    = map
  default = {
    mongodb = {
        instance_type = "t3.micro"
        port_no = 27017
    },
    redis = {
        instance_type = "t3.micro"
        port_no = 6379
    },
    mysql = {
        instance_type = "t3.micro"
        port_no = 3306
    },
    rabbitmq = {
        instance_type = "t3.micro"
        port_no = 5672
    },
    catalogue = {
        instance_type = "t3.micro"
        port_no = 8080
    },
    user = {
        instance_type = "t3.micro"
        port_no = 8080
    },
    cart = {
        instance_type = "t3.micro"
        port_no = 8080
    },
    shipping = {
        instance_type = "t3.micro"
        port_no = 8080
    },
    payment = {
        instance_type = "t3.micro"
        port_no = 8080
    },
    frontend = {
        instance_type = "t3.micro"
        port_no = 80
    }
  }
  description = "A list of valid instance types for the EC2 instance"
}

variable "zone_id"{
  type = string
  default = "Z07721523EJLIZ4JK5SSZ"
  description = "A Hosted zone ID of an instance"
}

variable "domain_name" {
  type = string
  default = "daws-92s.shop"
  description = "Hosted zone name/domain_name"
}