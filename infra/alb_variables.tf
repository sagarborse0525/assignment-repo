# ALB Variables
variable "alb_name" {}
variable "is_create_alb" {}
variable "is_alb_internal" {}
variable "alb_type" {}
variable "alb_idle_timeout" {}
variable "is_drop_invalid_header_fields_enabled" {}
variable "is_enable_http2_enabled" {}
variable "is_alb_deletion_protection_enabled" {}
variable "alb_tags" {}

#ALB Listener
variable "lb_listener_ports" {}
variable "listener_protocol" {}
variable "action_type" {}
variable "listener_ssl_policy" {}
variable "listener_certificate_arn" {}

#ALB Target Group
variable "is_alb_tg_enabled" {}
variable "alb_tg_name" {}
variable "alb_tg_port" {}
variable "alb_tg_protocol" {}
variable "is_alb_tg_health_check_enabled" {}
variable "alb_tg_interval" {}
variable "alb_tg_path" {}
variable "alb_tg_health_check_port" {}
variable "alb_tg_health_check_protocol" {}
variable "alb_tg_health_check_timeout" {}
variable "alb_tg_health_check_healthy_threshold" {}
variable "alb_tg_health_check_unhealthy_threshold" {}
variable "alb_tg_health_check_matcher" {}
variable "alb_tg_tags" {}

