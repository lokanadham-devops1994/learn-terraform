resource "aws_instance" "workspaces_demo" {
  ami           = data.aws_ami.jointdevops.id
#   instance_type = var.instance_type
    instance_type = lookup(var.instance_type, terraform.workspace)
  vpc_security_group_ids = [aws_security_group.workspaces_demo.id]
  tags = var.ec2_tags
}
resource "aws_security_group" "workspaces_demo" {
  name        = "roboshop-workspaces-demo-${terraform.workspace}"
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
    
  tags ={
    name  =  "roboshop-workspaces-demo-${terraform.workspace}"
  }

  lifecycle {
    create_before_destroy = true
  }
}