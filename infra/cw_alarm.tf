module "create_asg_cpu_high_alarm" {
  source = "../module/monitoring/cloudwatch_metric"

  create_cw_alarm          = var.create_cw_alarm
  alarm_name               = var.alarm_name
  cw_alarm_description     = var.cw_alarm_description
  cw_comparison_operator   = var.cw_comparison_operator
  cw_threshold             = var.cw_threshold
  cw_evaluation_periods    = var.cw_evaluation_periods
  cw_period                = var.cw_period
  cw_namespace             = var.cw_namespace
  cw_metric_name           = var.cw_metric_name
  cw_statistic             = var.cw_statistic
  autoscaling_group_name   = aws_autoscaling_group.app_asg.name
  load_balancer_arn_suffix = var.load_balancer_arn_suffix
  target_group_arn_suffix  = var.target_group_arn_suffix
  sns_topic_arn            = var.sns_topic_arn
  prefix                   = var.prefix_name
  created_by               = var.createdBy
  env                      = var.env_name

}

module "create_asg_status_check_failed" {
  source = "../module/monitoring/cloudwatch_metric"

  create_cw_alarm          = var.asg_status_create_cw_alarm
  alarm_name               = var.asg_status_alarm_name
  cw_alarm_description     = var.asg_status_cw_alarm_description
  cw_comparison_operator   = var.asg_status_cw_comparison_operator
  cw_threshold             = var.asg_status_cw_threshold
  cw_evaluation_periods    = var.asg_status_cw_evaluation_periods
  cw_period                = var.asg_status_cw_period
  cw_namespace             = var.asg_status_cw_namespace
  cw_metric_name           = var.asg_status_cw_metric_name
  cw_statistic             = var.asg_status_cw_statistic
  autoscaling_group_name   = aws_autoscaling_group.app_asg.name
  load_balancer_arn_suffix = module.create_app_alb.load_balancer_arn_suffix
  target_group_arn_suffix  = module.create_app_tg.target_group_arn_suffix
  sns_topic_arn            = var.asg_status_sns_topic_arn
  prefix                   = var.prefix_name
  created_by               = var.createdBy
  env                      = var.env_name

}