#  Application Load Balancer
module "create_app_alb" {
  source = "../module/elb/alb"

  is_create_alb                      = var.is_create_alb
  alb_name                           = var.alb_name
  is_alb_internal                    = var.is_alb_internal
  alb_type                           = var.alb_type
  alb_sg_ids                         = [module.create_alb_security_group.sg_id]
  alb_subnet_ids                     = module.create_subnet.pub_subnet_id
  alb_idle_timeout                   = var.alb_idle_timeout
  is_enable_http2_enabled            = var.is_enable_http2_enabled
  is_alb_deletion_protection_enabled = var.is_alb_deletion_protection_enabled
  prefix                             = var.prefix_name
  created_by                         = var.createdBy
  env                                = var.env_name
  alb_tags                           = var.alb_tags

}



module "create_app_tg" {
  source            = "../module/elb/target_group"
  is_alb_tg_enabled = var.is_alb_tg_enabled
  alb_tg_name       = var.alb_tg_name
  alb_tg_port       = var.alb_tg_port
  alb_tg_protocol   = var.alb_tg_protocol
  vpc_id            = module.create_vpc.vpc_id

  #  Health Check

  is_alb_tg_health_check_enabled          = var.is_alb_tg_health_check_enabled
  alb_tg_interval                         = var.alb_tg_interval
  alb_tg_path                             = var.alb_tg_path
  alb_tg_health_check_port                = var.alb_tg_health_check_port
  alb_tg_health_check_protocol            = var.alb_tg_health_check_protocol
  alb_tg_health_check_timeout             = var.alb_tg_health_check_timeout
  alb_tg_health_check_healthy_threshold   = var.alb_tg_health_check_healthy_threshold
  alb_tg_health_check_unhealthy_threshold = var.alb_tg_health_check_unhealthy_threshold
  alb_tg_health_check_matcher             = var.alb_tg_health_check_matcher
  prefix                                  = var.prefix_name
  created_by                              = var.createdBy
  env                                     = var.env_name
  alb_tg_tags                             = var.alb_tg_tags
}


# ALB Listener
module "create_app_alb_listener" {
  source                   = "../module/elb/listener"
  lb_arn                   = module.create_app_alb.alb_arn
  lb_listener_ports        = var.lb_listener_ports
  listener_protocol        = var.listener_protocol
  listener_ssl_policy      = var.listener_ssl_policy
  listener_certificate_arn = var.listener_certificate_arn
  target_group_arn         = module.create_app_tg.alb_group_arn
  action_type              = var.action_type
}
