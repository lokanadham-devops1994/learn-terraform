module "ec2_instance" {
    source = "../terraform-aws-instance-common"
    project = "roboshop"
    environment = "dev"
    component =  "mongodb"
    securitygroup_ids = ["sg-072c30c6865a9da69"]
}