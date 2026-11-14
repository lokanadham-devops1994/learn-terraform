resource "aws_instance" "provisioners" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.provisioners.id]
   
   provisioner "local-exec" {
    command = "echo The server's IP address is ${self.private_ip} > inventory.ini"
  }

  provisioner "local-exec" {
    command = "echo Created-time provisioner"  # instance created
  }

   provisioner "local-exec" {
    when    = destroy
    command = "echo 'Destroy-time provisioner'"  # instance destroy
  }

   connection {
    type        = "ssh"
    user        = "ec2-user"
    password    = "DevOps321" 
    host        = self.public_ip
  }
  
#   provisioner "remote-exec" {
#     inline = [ 
#         "sudo dnf install nginx -y",        # nginx paackage is installed
#         "sudo systemctl start nginx",       # nginx paackage is started
#         "sudo systemctl enable nginx",      # nginx paackage is enabled
#     ]
#   }

  provisioner "file" {
    source      = "bootstrap.sh"            # Localfile path
    destination = "/tmp/bootstrap.sh"       # Remote target path
  }

  provisioner "remote-exec" {
    inline = [ 
        "chmod +x /tmp/bootstrap.sh",
        "sudo sh /tmp/bootstrap.sh"
     ]
    
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [ 
        "sudo systemctl stop nginx"         # nginx paackage is stopped
     ]
  }


  tags = var.ec2_tags
 }

resource "aws_security_group" "provisioners" {
  name        = "roboshop-provisioners"
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
#     name = "roboshop-provisioners"
# }
    tags = var.ec2_tags
}
