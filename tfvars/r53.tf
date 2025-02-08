resource "aws_route53_record" "expense" {
  count = length(var.instances)
  zone_id = var.zone_id
  name    = var.instances[count.index] == "frontend" && var.environment == "prod" ? var.domain_name : "${var.instances[count.index]}-${var.environment}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [var.instances[count.index] == "frontend" && var.environment == "prod" ? aws_instance.expense[count.index].public_ip : aws_instance.expense[count.index].private_ip] ## List type
  allow_overwrite = true
}

/* # resource "aws_route53_record" "public" {
#   zone_id = var.zone_id
#   name    = "${var.instances[2]}.${var.domain_name}"  #interpolation where you can combine variable with text
#   type    = "A"
#   ttl     = 1
#   records = [aws_instance.this[2].public_ip]
#   allow_overwrite = true
# }
 */