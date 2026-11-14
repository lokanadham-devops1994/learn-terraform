resource "aws_route53_record" "roboshop" {
  for_each = aws_instance.roboshop # ec2_instance output will become used for input of Route53
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}" # mogodb.daws-92s.shop
  type    = "A"
#   ttl   = 300  # time to live 300 seconds
    ttl   = 1 
  records = [each.value.private_ip]
  allow_overwrite = true
}

resource "aws_route53_record" "frontend" {
  count = contains(keys(var.instances_type), "frontend")  ? 1 : 0
  zone_id = var.zone_id
  name    = "${var.domain_name}" # daws-92s.shop
  type    = "A"
#   ttl   = 300  # time to live 300 seconds
    ttl   = 1 
  records = [lookup(aws_instance.roboshop,"frontend").public_ip]
  allow_overwrite = true
}