resource "aws_lb_listener" "listener" {
  count = length(var.lb_listener_ports) == length(var.listener_protocol) ? length(var.lb_listener_ports) : 0

  load_balancer_arn = var.lb_arn
  port              = element(var.lb_listener_ports, count.index)
  protocol          = element(var.listener_protocol, count.index)
  ssl_policy        = element(var.listener_protocol, count.index) == "HTTPS" || element(var.listener_protocol, count.index) == "TLS" ? var.listener_ssl_policy : ""
  certificate_arn   = element(var.listener_protocol, count.index) == "HTTPS" || element(var.listener_protocol, count.index) == "TLS" ? var.listener_certificate_arn : ""

  default_action {
    target_group_arn = var.target_group_arn
    type             = var.action_type
  }
}
