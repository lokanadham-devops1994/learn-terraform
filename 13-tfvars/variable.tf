variable "instance_type" {
  type    = string

}

variable "environment" {
  type = string
}

variable "ec2_tags" {
  type = map
  default = {
    Name = "roboshop-tfvars-demo"
    Environment = "dev"
    Project = "roboshop"
    Terraform = "true"
    # Component = "data_source"
  }
  description = "Tags for the EC2 instance"
}

variable "cidr_blocks" {
  type    = list
  default = ["0.0.0.0/0"]
    description = "CIDR blocks for security group rules"
}

variable "from_port" {
  type    = number
  default = 0
  description = "The starting port for security group rules"
}

variable "to_port" {
  type    = number
  default = 0
  description = "The ending port for security group rules"
}

variable "protocol" {
  type    = string
  default = "-1"
  description = "The protocol for security group rules"
}