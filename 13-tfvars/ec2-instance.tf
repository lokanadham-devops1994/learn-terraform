resource "aws_instance" "tfvars_demo" {
  ami           = data.aws_ami.jointdevops.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.tfvars_demo.id]
  tags = var.ec2_tags
}
resource "aws_security_group" "tfvars_demo" {
  name        = "roboshop-tfvars-demo-${var.environment}"
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
    name        = "roboshop-tfvars-demo-${var.environment}"
  }

  lifecycle {
    create_before_destroy = true
  }
}