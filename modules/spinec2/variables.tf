variable "aws_region" {}

provider "aws" {
        region = "${var.aws_region}"
}

variable "ws_artifacts_version" {
	default="1.0"
}

variable "as_artifacts_version" {
        default="1.0"
}

variable "keypair_name" {
	default = "hv"
}

variable "desired_capacity" {
	default = "1"
}


variable "avl_zones" {
	default = ["us-east-2b"]
}

variable "vpc_id" {}
variable "subnet_cidr" {}
