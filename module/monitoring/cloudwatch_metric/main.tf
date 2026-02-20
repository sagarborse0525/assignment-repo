resource "aws_cloudwatch_metric_alarm" "cw_alarm" {
  count = var.create_cw_alarm ? 1: 0

  alarm_name = (
    var.alarm_name != "" && var.alarm_name != null &&
    var.prefix != "" && var.prefix != null &&
    var.created_by != "" && var.created_by != null &&
    var.env != "" && var.env != null ?
    lower(format("%s-%s-%s-%s", var.prefix, var.env, var.alarm_name, var.created_by)) :
    lower(var.alarm_name)
  )

  alarm_description   = var.cw_alarm_description
  comparison_operator = var.cw_comparison_operator
  threshold           = var.cw_threshold
  evaluation_periods  = var.cw_evaluation_periods
  period              = var.cw_period
  namespace           = var.cw_namespace
  metric_name         = var.cw_metric_name
  statistic           = var.cw_statistic


  dimensions = (
    var.autoscaling_group_name != null && var.autoscaling_group_name != "" ?
      {
        AutoScalingGroupName = var.autoscaling_group_name
      } :
    var.load_balancer_arn_suffix != null && var.target_group_arn_suffix != null ?
      {
        LoadBalancer = var.load_balancer_arn_suffix
        TargetGroup  = var.target_group_arn_suffix
      } :
      {}
  )

  alarm_actions = [var.sns_topic_arn]
  ok_actions    = [var.sns_topic_arn]
}