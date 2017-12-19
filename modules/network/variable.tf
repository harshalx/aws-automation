variable "aws_region" {}
variable "aws_vpcp_vpc_cidr" {}
variable "route_53_name" {}



output "aws-vpc-id" {
  value = "${aws_vpc.aws-vpcp-vpc.id}"
}


#output "aws-route53-zone-id" {
#  value = "${aws_route53_zone.private.zone_id}"
#}



