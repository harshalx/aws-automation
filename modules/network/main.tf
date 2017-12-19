provider "aws" {
        region = "${var.aws_region}"
}



resource "aws_vpc" "aws-vpcp-vpc" {
        cidr_block = "${var.aws_vpcp_vpc_cidr}"
        enable_dns_hostnames = true
        enable_dns_support   = true
        tags {
    Name = "aws-vpcp-vpc"
  }
}


resource "aws_internet_gateway" "aws-vpcp-ig" {
        vpc_id = "${aws_vpc.aws-vpcp-vpc.id}"
}

resource "aws_route" "aws-vpcp-rt" {
        route_table_id = "${aws_vpc.aws-vpcp-vpc.main_route_table_id}"
        destination_cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.aws-vpcp-ig.id}"
}


#resource "aws_route53_zone" "private" {
#  name = "${var.route_53_name}"
#  vpc_id = "${aws_vpc.aws-vpcp-vpc.id}"
#}
