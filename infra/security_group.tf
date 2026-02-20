#############  ALB Security Group  #############
module "create_alb_security_group" {
  source = "../module/security/security_group"

  create_vpc  = var.create_vpc_alb_sg
  sg_name     = var.alb_sg_name
  description = var.alb_sg_description
  vpc_id      = module.create_vpc.vpc_id
  ingress     = var.alb_sg_ingress
  egress      = var.alb_sg_egress
  prefix      = var.prefix_name
  created_by  = var.createdBy
  sg_tags     = var.alb_sg_tags
  env         = var.env_name

}

module "create_appserver_security_group" {
  source = "../module/security/security_group"

  create_vpc  = var.create_vpc_app_sg
  sg_name     = var.app_sg_name
  description = var.app_sg_description
  vpc_id      = module.create_vpc.vpc_id
  ingress = [
    {
      description        = "Allow HTTPS"
      from_port          = 0
      to_port            = 0
      protocol           = "tcp"
      cidr_blocks        = []
      security_group_ids = ["${module.create_alb_security_group.sg_id}"]
    }
  ]

  egress = [
    {
      from_port          = 0
      to_port            = 0
      protocol           = "-1"
      cidr_blocks        = ["0.0.0.0/0"]
      security_group_ids = []
    }
  ]
  prefix     = var.prefix_name
  created_by = var.createdBy
  sg_tags    = var.app_sg_tags
  env        = var.env_name

}


output "sg_id" {
  value = module.create_alb_security_group.sg_id

}