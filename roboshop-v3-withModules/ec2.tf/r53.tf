resource "aws_route53_record" "www" {
  for_each = var.components

  zone_id  = var.zoneid
  name     = "${lookup(each.value, "name", null)}.roboshop.internal"
  type     = "A"
  ttl      = 10
  records  = [lookup(lookup(aws_instance.instance, each.key, null), "private_ip", null)]
}