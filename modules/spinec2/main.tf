#resource "aws_subnet" "subnet" {
#        vpc_id = "${var.vpc_id}"
#        cidr_block = "${var.subnet_cidr}"
#        availability_zone = "ap-southeast-2a"
#}


data "aws_instances" "my-instances" {
  instance_tags = {
    "Framework" = "Kitchen-terraform"
  }
  depends_on =  [aws_autoscaling_group.appserver-asg]
}

resource "aws_launch_configuration" "lc-conf" {
  name_prefix   = "kitchen-terraform-"
  image_id = var.ami_id
  instance_type = "t2.micro"
  key_name = var.keypair_name
  security_groups = ["sg-20a4df47"]
  associate_public_ip_address = true
#  user_data = "${file("modules/spinec2/userdata.sh")}"
}

resource "aws_autoscaling_group" "appserver-asg" {
  availability_zones = var.avl_zones
  name		     = "appserver-asg-group"
  max_size	     = 4
  min_size	     = 1
  desired_capacity   = var.desired_capacity
  default_cooldown   = 120
  launch_configuration = aws_launch_configuration.lc-conf.name
  health_check_type = "EC2"
  vpc_zone_identifier = ["subnet-c61350b0"]
  tag {
    key                 = "Framework"
    value               = "Kitchen-terraform"
    propagate_at_launch = true
  }
  tag {
    key                 = "Name"
    value               = "Kitchen-terraform-test-vm"
    propagate_at_launch = true
  }
}

output "vm_public_ip" {
 value = data.aws_instances.my-instances.public_ips
}
