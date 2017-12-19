module "network" {
  source = "./modules/network"
  aws_region = "${var.aws_region}"
  route_53_name = "${var.route_53_name}"
  aws_vpcp_vpc_cidr = "${var.aws_vpcp_vpc_cidr}"
}


module "spinec2" {
  source = "./modules/spinec2"
  vpc_id = "${module.network.aws-vpc-id}"
  subnet_cidr = "${var.aws_subnet_cidr}"
  aws_region = "${var.aws_region}"
}
