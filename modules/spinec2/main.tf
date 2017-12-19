resource "aws_security_group" "security_group" {
        name = "appserver-sg"
        description = "used in instance"
        vpc_id = "${var.vpc_id}"


 ingress {
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
 }

 ingress {
        from_port = 8
        to_port = 0
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
 }

 egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

 }
}

resource "aws_subnet" "subnet" {
        vpc_id = "${var.vpc_id}"
        cidr_block = "${var.subnet_cidr}"
        availability_zone = "us-east-2b"
        map_public_ip_on_launch = true

}

#data "aws_ami" "appserver_ami" {
#  most_recent = true
#  image_id = "ami-8999beec"
#}


#resource "aws_elb" "appserver-elb" {
#  name               = "appserver-elb-${var.env}"
#  availability_zones = ["us-west-2a", "us-west-2c"]
#  internal           = false
##  subnets	     = "${var.elb_subnets}"
#  security_groups    = "${var.security_groups}"

#  listener {
#    instance_port     = 8080
#    instance_protocol = "http"
#    lb_port           = 80
#    lb_protocol       = "http"
#  }


#  listener {
#    instance_port      = 8000
#    instance_protocol  = "http"
#    lb_port            = 443
#    lb_protocol        = "https"
#    ssl_certificate_id = "arn:aws:iam::123456789012:server-certificate/certName"
#  }

#  health_check {
#    healthy_threshold   = 2
#    unhealthy_threshold = 2
#    timeout             = 3
#    target              = "HTTP:8080/"
#    interval            = 30
#  }

#  cross_zone_load_balancing   = true
#  idle_timeout                = 400
#  connection_draining         = true
#  connection_draining_timeout = 400

#}

resource "aws_launch_configuration" "appserver-lc" {
  name	= "appserver-lc"
  #use the publicly available red-hat linux AMI
  image_id = "ami-cfdafaaa" 
  instance_type = "t2.micro"
  key_name = "${var.keypair_name}"
  security_groups = ["${aws_security_group.security_group.id}"]
  associate_public_ip_address = false
  user_data = "${file("modules/spinec2/userdata.sh")}"
}

resource "aws_autoscaling_group" "appserver-asg" {
  availability_zones = "${var.avl_zones}"
  name		     = "appserver-asg-group"
  max_size	     = 4
  min_size	     = 1
  desired_capacity   = "${var.desired_capacity}"
  default_cooldown   = 120
  launch_configuration = "${aws_launch_configuration.appserver-lc.name}"
  health_check_type = "EC2"
  vpc_zone_identifier = ["${aws_subnet.subnet.id}"]
  force_delete = "false"
  tags		      = [{
			  key = "Name"
			  value = "${format("appserver-%s", "ms")}"
 			  propagate_at_launch = true
		        }
			 ]
#  load_balancers     = ["${aws_elb.appserver-elb.name}"]

}
