# ALB SG
variable "create_vpc_alb_sg" {}
variable "alb_sg_name" {}
variable "alb_sg_description" {}
variable "alb_sg_ingress" {}
variable "alb_sg_egress" {}
variable "alb_sg_tags" {}

# APP SG
variable "create_vpc_app_sg" {}
variable "app_sg_name" {}
variable "app_sg_description" {}
variable "app_sg_ingress" {}
variable "app_sg_egress" {}
variable "app_sg_tags" {}
