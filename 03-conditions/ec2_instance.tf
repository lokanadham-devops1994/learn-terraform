resource "aws_instance" "roboshop-conditions" {
  ami           = "ami-0055977a6e828a4f4"
  instance_type = var.environment == "dev" ? "t3.micro" : "t3.medium"
  vpc_security_group_ids = [aws_security_group.roboshop-conditions.id]
  tags = {  
    Name = "roboshop-conditions"
  }
}
resource "aws_security_group" "roboshop-conditions" {
  name        = "roboshop-conditions"
  description = "Allow TLS inbound traffic and all outbound traffic"
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
    Name = "roboshop-conditions"
  }
}