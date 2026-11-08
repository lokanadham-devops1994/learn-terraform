  output "instance_info" {
    value = aws_instance.roboshop[0].private_ip
    # sensitive = true
    # description = "Information about the created EC2 instances"
    # depends_on = [aws_instance.roboshop]
 }  

# only one instance public_ip, private_ip address
#  output "instance_public_ips" {
#   description = "The public IP addresses of the roboshop instances"
#   value       = aws_instance.roboshop[0].public_ip
# }

# output "instance_private_ips" {
#   description = "The private IP addresses of the roboshop instances"
#   value       = aws_instance.roboshop[0].private_ip
# }                

# # whole instances public_ip, private_ip address
# output "instance_public_ips" {
#   description = "The public IP addresses of the roboshop instances"
#   value       = aws_instance.roboshop[*].public_ip
# }

# output "instance_private_ips" {
#   description = "The private IP addresses of the roboshop instances"
#   value       = aws_instance.roboshop[*].private_ip
# }                
