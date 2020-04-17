variable "aws_region" {
         default = "ap-southeast-2"
}

##variable "route_53_name" {
#    type = "string"
#    default = "aws.vpcp.qualys.com"
#}


variable "key_pair" {
    type = string
    default = "hv"
}

variable "aws_vpcp_vpc_cidr" {
   type = string
   default = "10.20.0.0/16"
}

variable "aws_availability_zone_subnet1" {
   type = string
   default = "ap-southeast-2a"
}

variable "aws_subnet01_cidr" {
   type = string
   default = "10.20.6.0/28"
}

variable "aws_subnet_cidr" {
   type = string
   default = "10.20.5.64/26"
}

variable "ami_id" {
   type = string
  default = "ami-0970010f37c4f9c8d"
}

variable "security_grp" {
  type = string
  default = "sg-20a4df47"
}
