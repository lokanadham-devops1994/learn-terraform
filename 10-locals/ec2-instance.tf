resource "aws_instance" "locals-demo" {
  ami           = var.ami_id
  instance_type = local.instance_type
  vpc_security_group_ids = [aws_security_group.locals-demo.id]
#   tags = var.ec2_tags
  tags = local.ec2_tags
}

resource "aws_security_group" "locals-demo" {
  name        = "roboshop-locals-demo"
  description = "Allow TLS inbound traffic and all outbound traffic"
  ingress {
        from_port   = var.from_port
        to_port     = var.to_port
        protocol    = var.protocol
        cidr_blocks = var.cidr_blocks
  }
  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol
    cidr_blocks      = var.cidr_blocks
  }
    
#   tags ={
#     name = "roboshop-locals-demo"
# }
#     tags = var.ec2_tags
# }
tags = local.ec2_tags
}