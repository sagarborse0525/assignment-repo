output "lb_attachment_id" {
  description = "An output variable where id of the LoadBalanacer attachment will get stored."
  value       = length(var.tg_target_id) == length(var.target_group_arn) ? aws_lb_target_group_attachment.lb_group_attach[0].id : null
}
