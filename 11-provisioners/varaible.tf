variable "ami_id" {
  type    = string
  default = "ami-0055977a6e828a4f4"
  description = "The AMI ID for the EC2 instance"
}

variable "instance_type" {
  type    = string
   default = "t3.micro"
#   default = "t3.small"
  description = "The instance type for the EC2 instance"

  validation {
    condition     = contains(["t3.small", "t3.medium", "t3.micro", "t3.large"], var.instance_type)
    error_message = "The instance type must be one of: t3.small, t3.medium, t3.micro, t3.large."
  }
}

variable "ec2_tags" {
  type = map
  default = {
    Name = "roboshop-remote-state-demo-1"
    Environment = "dev"
    Project = "roboshop"
    Terraform = "true"
    Component = "data_source"
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