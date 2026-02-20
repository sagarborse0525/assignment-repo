# locals
### User Data Scripts ###
locals {
  user_data = <<-EOF
    #!/bin/bash
    echo "Updating package list..."
    yum update -y
    
    echo "Installing Nginx..."
    yum install -y nginx
    
    echo "Starting Nginx service..."
    systemctl start nginx
    
    echo "Enabling Nginx to start on boot..."
    systemctl enable nginx
    
    echo "Creating a simple index.html file..."
    echo '<h1>Hello from your Web Server!</h1>' > /var/www/html/index.html
    
    echo "Web server setup complete!"
  EOF

}

### Data source ###
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

### Launch Template  ###
resource "aws_launch_template" "app_template" {
  name_prefix   = "${var.prefix_name}-${var.env_name}-${var.lt_name}"
  image_id      = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  user_data     = base64encode(local.user_data)

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 8
      encrypted   = true
    }
  }

  iam_instance_profile {
    name = aws_iam_instance_profile.app_profile.name
  }

  vpc_security_group_ids = [module.create_appserver_security_group.sg_id]

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.prefix_name}-${var.env_name}-${var.lt_name}"
    }
  }
}

resource "aws_autoscaling_group" "app_asg" {
  name                      = "${var.prefix_name}-${var.env_name}-${var.asg_name}"
  vpc_zone_identifier       = module.create_subnet.pvt_subnet_id
  desired_capacity          = 2
  max_size                  = 2
  min_size                  = 2
  health_check_type         = "ELB"
  health_check_grace_period = 300
  target_group_arns         = [module.create_app_tg.alb_group_arn]

  launch_template {
    id      = aws_launch_template.app_template.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.prefix_name}-${var.env_name}-${var.asg_name}"
    propagate_at_launch = true
  }
}

resource "aws_iam_instance_profile" "app_profile" {
  name = "${var.prefix_name}-${var.env_name}-${var.iam_instance_profile_name}"
  role = aws_iam_role.app_role.name
}