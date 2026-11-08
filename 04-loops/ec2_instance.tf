resource "aws_instance" "roboshop" {
  # count = 10
  count = length(var.instances_type)
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [
  aws_security_group.common.id,
  aws_security_group.roboshop[count.index].id
  ]
  tags = {
    # Name = "roboshop_web"
    Name = "${var.project}-${var.environment}-${var.instances_type[count.index]}"
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
  # count       = 10
  count = length(var.instances_type)
  name        = "${var.project}-${var.environment}-${var.instances_type[count.index]}"
  description = "A component security group for roboshop instance"
  ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
    
  tags = {
    Name = "${var.project}-${var.environment}-${var.instances_type[count.index]}"
  }
}
