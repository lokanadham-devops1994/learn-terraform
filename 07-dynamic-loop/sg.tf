resource "aws_security_group" "dynamic" {
  name        = "dynamic-demo"
  description = "Allow TLS inbound traffic and all outbound traffic"
  dynamic "ingress" {   # Here terraform will give block_name as a special variable 
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.port_no
        to_port     = ingress.value.port_no
        protocol    = "tcp"
        cidr_blocks = ingress.value.cidr_blocks
    }    
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
    
  tags = {
    Name = "dynamic-demo"
  }
}