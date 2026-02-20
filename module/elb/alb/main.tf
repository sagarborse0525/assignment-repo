resource "aws_lb" "alb" {
  count              = var.is_create_alb ? 1 : 0
  name               = var.prefix != null && var.prefix != "" && var.created_by != null && var.created_by != "" ? format("%s-%s-%s-%s", var.prefix, var.env, var.alb_name, var.created_by) : var.prefix != null && var.prefix != "" ? format("%s-%s-%s", var.prefix, var.env, var.alb_name) : format("%s-%s", var.env, var.alb_name)
  internal           = var.is_alb_internal
  load_balancer_type = var.alb_type
  security_groups    = var.alb_sg_ids
  subnets            = var.alb_subnet_ids

  idle_timeout               = var.alb_idle_timeout
  enable_http2               = var.is_enable_http2_enabled
  enable_deletion_protection = var.is_alb_deletion_protection_enabled

  tags = merge(
    {
      "Name" = var.prefix != null && var.prefix != "" && var.created_by != null && var.created_by != "" ? format("%s-%s-%s-%s", var.prefix, var.env, var.alb_name, var.created_by) : var.prefix != null && var.prefix != "" ? format("%s-%s-%s", var.prefix, var.env, var.alb_name) : format("%s-%s", var.env, var.alb_name)
    },

    var.alb_tags,
  )
}
