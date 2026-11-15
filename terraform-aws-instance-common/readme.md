# EC2 Instance creation

### Resources
* EC2 Instance -> aws_instance.main

### Inputs
* instance_type(Optional)-By default it takes t3.micro
* security group_ids(Mandatory)-A list of security group ID'S to attach instance
* project(Mandatory)- Name you have to mentioned the project
* environment(Mandatory)-which environment this resouce is getting created
* componet(Mandatory)-which componet this resource is getting created for
* ec2_tags(Optional)- A map of tags attached to the instance

### Outputs
* public_ip-Public ip of the instance created
* private_ip-Private ip of the instance created
* instace_id-Instance id of the instance created