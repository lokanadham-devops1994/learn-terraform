locals {
  instance_type = "t3.micro"
  name = "${var.project}-${var.environment}"
#   ec2_tags={
#     name = local.name
#   }

  common_tags = {
    project = var.project
    environment = var.environment
    terraform = "true"
  }
  ec2_tags = merge(
    local.common_tags,
  {
    name = "${local.name}-locals-demo"
  }
  )
}