#### resource for ALB ####

resource "aws_lb_target_group" "alb_target_group" {
  count       = var.is_alb_tg_enabled ? 1 : 0
  name        = var.prefix != null && var.prefix != "" && var.created_by != null && var.created_by != "" ? format("%s-%s-%s-%s", var.prefix, var.env, var.alb_tg_name, var.created_by) : var.prefix != null && var.prefix != "" ? format("%s-%s-%s", var.prefix, var.env, var.alb_tg_name) : format("%s-%s", var.env, var.alb_tg_name)
  port        = var.alb_tg_port
  protocol    = var.alb_tg_protocol
  vpc_id      = var.vpc_id
  target_type = var.alb_tg_target_type

  tags = merge(
    {
      "Name" = var.prefix != null && var.prefix != "" && var.created_by != null && var.created_by != "" ? format("%s-%s-%s-%s", var.prefix, var.env, var.alb_tg_name, var.created_by) : var.prefix != null && var.prefix != "" ? format("%s-%s-%s", var.prefix, var.env, var.alb_tg_name) : format("%s-%s", var.env, var.alb_tg_name)
    },
    var.alb_tg_tags,
  )


  ### Health Check Block for ALB ###
  health_check {
    enabled             = var.is_alb_tg_health_check_enabled
    interval            = var.alb_tg_interval
    path                = var.alb_tg_path
    port                = var.alb_tg_health_check_port
    protocol            = var.alb_tg_health_check_protocol
    timeout             = var.alb_tg_health_check_timeout
    healthy_threshold   = var.alb_tg_health_check_healthy_threshold
    unhealthy_threshold = var.alb_tg_health_check_unhealthy_threshold
    matcher             = var.alb_tg_health_check_matcher
  }
}
