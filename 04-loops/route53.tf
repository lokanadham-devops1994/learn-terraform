resource "aws_route53_record" "roboshop" {
  count = 10
  zone_id = var.zone_id
  name    = "${var.instances_type[count.index]}.${var.domain_name}"
  type    = "A"
#   ttl   = 300  # time to live 300 seconds
    ttl   = 1 
  records = [aws_instance.roboshop[count.index].private_ip]
  allow_overwrite = true
}

resource "aws_route53_record" "frontend" {
  count = contains(var.instances_type, "frontend")  ? 1 : 0
  zone_id = var.zone_id
  name    = "${var.domain_name}" # daws-92s.shop
  type    = "A"
#   ttl   = 300  # time to live 300 seconds
    ttl   = 1 
  records = [aws_instance.roboshop[index(var.instances_type,"frontend")].public_ip]
  allow_overwrite = true
}