module "ec2_instance" {
  # source            = "../terraform-aws-instance-common"    # from local cocde access to local
  source            = "git::https://github.com/lokanadham-devops1994/learn-terraform.git?ref=main"
  project           = var.project
  environment       = var.environment
  component         = var.component
  securitygroup_ids = var.securitygroup_ids
}