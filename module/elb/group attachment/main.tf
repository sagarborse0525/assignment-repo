resource "aws_lb_target_group_attachment" "lb_group_attach" {
  count = length(var.tg_target_id) == length(var.target_group_arn) ? length(var.tg_target_id) : 0

  target_group_arn  = var.target_group_arn[count.index]
  target_id         = var.tg_target_id[count.index]
  port              = var.tg_attach_port
  availability_zone = var.availability_zone
} 