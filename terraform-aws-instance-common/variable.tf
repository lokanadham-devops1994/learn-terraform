# Optional
variable "instance_type" {
  default = "t3.micro"
}

variable "securitygroup_ids" {
  type = list(any)
}

variable "project" {

}

variable "environment" {

}

variable "component" {

}
variable "ec2_tags" {
  default = {} # empty
}