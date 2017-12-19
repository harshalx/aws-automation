variable "aws_region" {
         default = "us-east-2"
}

variable "route_53_name" {
    type = "string"
    default = "aws.vpcp.qualys.com"
}


variable "key_pair" {
    type = "string"
    default = "hv"
}

variable "aws_vpcp_vpc_cidr" {
   type = "string"
   default = "10.130.0.0/16"

}
variable "aws_availability_zone_subnet1" {
   type = "string"
   default = "us-east-2a"

}

variable "aws_subnet01_cidr" {
   type = "string"
   default = "10.130.2.0/24"
}

variable "aws_subnet_cidr" {
   type = "string"
   default = "10.130.1.0/24"
}

