data "aws_ami" "jointdevops" {
    most_recent = true
    owners      = ["973714476881"] # Canonical's official AWS Account ID
     
    filter {
    name   = "name" 
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

output "ami_id" {
  value = data.aws_ami.jointdevops.id
}
