prefix_name    = "citius-cloud"
env_name       = "dev"
app_name       = "project"
createdBy      = "tf"
region         = "us-east-1"
mandatory_tags = {}

###############################################
# VPC
###############################################
create_vpc                  = true
vpc_name                    = "vpc"
vpc_cidr                    = "10.0.0.0/16"
tenancy                     = "default"
enable_dns_hostname_support = true
enable_dns_support          = true
vpc_tags                    = {}
########################################################################################
# IGW
########################################################################################
create_igw = true
igw_name   = "igw"
igw_tags   = null

########################################################################################
# NAT Gateway
########################################################################################

create_nat_gateway_1a = true
nat_gw_name_1a        = "nat-gw-az1a"
eip_1a                = null
pub_subnet_id_1a      = null
connectivity_type_1a  = "public"
nat_gw_tags_1a        = {}

create_nat_gateway_1b = true
nat_gw_name_1b        = "nat-gw-az1b"
eip_1b                = null
pub_subnet_id_1b      = null
connectivity_type_1b  = "public"
nat_gw_tags_1b        = {}

############################################
# Elastic IP Address
############################################
create_eip = true
eip_name = [
  "eip-nat-az1a",
  "eip-nat-az1b"
]
eip_associate_instance_id = null
eip_tags                  = {}

########################################################################################
# Public Subnet
########################################################################################

create_public_subnet = true
public_subnet_names = [
  "pub-sub-az1a",
  "pub-sub-az1b"
]
azs = [
  "us-east-1a",
  "us-east-1b"
]
public_subnets = [
  "10.0.0.0/20",
  "10.0.16.0/20"
]
map_public_ip_on_launch = true
public_subnet_tags      = {}

########################################################################################
# private Subnet
########################################################################################

create_private_subnet = true
private_subnet_names = [
  "pvt-sub-az1a",
  "pvt-sub-az1b"
]
private_subnets = [
  "10.0.128.0/20",
  "10.0.144.0/20"
]
private_subnet_tags = {}

########################################################################################
# Route Table
########################################################################################

create_public_route_table_1a = true
public_route_table_name_1a   = "pub-rtb-1a"
public_route_table_tags_1a   = {}

create_public_route_table_1b = true
public_route_table_name_1b   = "pub-rtb-1b"
public_route_table_tags_1b   = {}

create_private_route_table_1a = true
private_route_table_name_1a   = "pvt-rtb-1a"
private_route_table_tags_1a   = {}

create_private_route_table_1b = true
private_route_table_name_1b   = "pvt-rtb-1b"
private_route_table_tags_1b   = {}

########################################################################################
# Route Table Association
########################################################################################
create_private_rtb_assoc = true
create_public_rtb_assoc  = true
########################################################################################
# Route
########################################################################################

destination                 = ["0.0.0.0/0"]
destination_1a              = ["0.0.0.0/0"]
destination_1b              = ["0.0.0.0/0"]
nat_gw_route_destination_1a = "0.0.0.0/0"
nat_gw_route_destination_1b = "0.0.0.0/0"

########################################################################################
# ALB Security Group Rules
########################################################################################
create_vpc_alb_sg  = true
alb_sg_name        = "alb-sg"
alb_sg_description = "demo"
alb_sg_tags        = {}
alb_sg_ingress = [

  {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

]

alb_sg_egress = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

########################################################################################
# APP Security Group Rules
########################################################################################
create_vpc_app_sg  = true
app_sg_name        = "app-sg"
app_sg_description = "app sg"
app_sg_tags        = {}
app_sg_ingress     = []
app_sg_egress      = []

#ALB
alb_name                              = "app-alb"
is_create_alb                         = true
is_alb_internal                       = false
alb_type                              = "application"
alb_idle_timeout                      = 60
is_drop_invalid_header_fields_enabled = false
is_enable_http2_enabled               = true
is_alb_deletion_protection_enabled    = true
alb_tags                              = {}

#ALB Listener Values
lb_listener_ports           = [80]
listener_protocol        = ["HTTP"]
action_type              = "forward"
listener_ssl_policy      = null #"ELBSecurityPolicy-2016-08"
listener_certificate_arn = null #"arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4" # acm certificate arn

#ALB Target Group Values

is_alb_tg_enabled           = true
alb_tg_name                 = "app-tg"
alb_tg_port                 = 443
alb_tg_protocol             = "HTTPS"                 
is_alb_tg_health_check_enabled          = true 
alb_tg_interval                         = 30    
alb_tg_path                             = "/"
alb_tg_health_check_port                = "traffic-port"
alb_tg_health_check_protocol            = "HTTPS"
alb_tg_health_check_timeout             = 5
alb_tg_health_check_healthy_threshold   = 5
alb_tg_health_check_unhealthy_threshold = 2
alb_tg_health_check_matcher             = "200,403" 
alb_tg_tags = {}



# AutoScaling
lt_name = "app-template"
asg_name = "app-asg"

# S3 Bucket values
s3_bucket_name = "ljkluuvnvccsdfssrg"

# IAM Values
role_name = "app-role"
iam_role_policy_name = "app-role-policy"

# CloudWatch Matirx Alarm for asg high cpu
create_cw_alarm = true
alarm_name          = "asg-cpu-high"
cw_alarm_description   = "High average CPU usage across the ASG"
cw_comparison_operator = "GreaterThanThreshold"
cw_threshold           = 60
cw_evaluation_periods  = 1
cw_period              = 300
cw_namespace           = "AWS/EC2"
cw_metric_name         = "CPUUtilization"
cw_statistic           = "Average"
autoscaling_group_name = null
load_balancer_arn_suffix = null
target_group_arn_suffix = null
sns_topic_arn = "arn:aws:sns:us-east-1:608698602459:test"

# CloudWatch matrix asg status check failed
asg_status_create_cw_alarm = true
asg_status_alarm_name          = "asg-status-check-failed"
asg_status_cw_alarm_description   = "EC2 instance status check failed inside ASG"
asg_status_cw_comparison_operator = "GreaterThanThreshold"
asg_status_cw_threshold           = 1
asg_status_cw_evaluation_periods  = 1
asg_status_cw_period   = 60
asg_status_cw_namespace           = "AWS/EC2"
asg_status_cw_metric_name         = "StatusCheckFailed"
asg_status_cw_statistic           = "Maximum"
asg_status_autoscaling_group_name = null
asg_status_load_balancer_arn_suffix      = null
asg_status_target_group_arn_suffix       = null
asg_status_sns_topic_arn = "arn:aws:sns:us-east-1:608698602459:test"

