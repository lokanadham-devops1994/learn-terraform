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
  type    = list(string)
  default = ["mongodb", "redis","mysql","rabbitmq", "catalogue", "user", "cart", "shipping", "payment", "frontend" ]
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