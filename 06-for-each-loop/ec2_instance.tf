resource "aws_instance" "roboshop" {
  for_each = var.instances_type
  ami           = var.ami_id
  instance_type = each.value.instance_type
  vpc_security_group_ids = [
  aws_security_group.common.id,
  aws_security_group.roboshop[each.key].id
  ]
  tags = {
    # Name = "roboshop_web"
    Name = "${var.project}-${var.environment}-${each.key}"
  }
}

resource "aws_security_group" "common" {
  name        = "${var.project}-${var.environment}-common"
  description = "A common security group for roboshop instances"

#   ingress {
#         from_port   = 0
#         to_port     = 0
#         protocol    = "-1"
#         cidr_blocks = ["0.0.0.0/0"]
#   }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
    
  tags = {
    Name = "${var.project}-${var.environment}-common"
  }
}

resource "aws_security_group" "roboshop" {
  for_each = var.instances_type  # terraform will give a special variable each
  name        = "${var.project}-${var.environment}-${each.key}"
  description = "A component security group for roboshop instance"
  # ingress block
  ingress {
        from_port   = each.value.port_no
        to_port     = each.value.port_no
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
    
  tags = {
    Name = "${var.project}-${var.environment}-${each.key}"
  }
}
