variable "alarm_name" {
  description = "Name of the CW Alarm"
  type        = string
}

variable "create_cw_alarm" {
  type = bool
  default = false
  
}
variable "autoscaling_group_name" {
  description = "Name of the Auto Scaling Group"
  type        = string
}

variable "sns_topic_arn" {
  description = "SNS topic for alerts"
  type        = string
}

variable "prefix" {
  description = "prefix_name name."
  type        = string
  default     = null
}

variable "created_by" {
  description = "CreatedBy terrafrm name."
  type        = string
  default     = "tf"
}

variable "env" {
  description = "env_nameironment name."
  type        = string
  default     = null
}

variable "cw_alarm_description" {
  description = "CW Metrix description"
  type = string
  default = ""
  
}
variable "cw_comparison_operator" {
  description = " (Required) The arithmetic operation to use when comparing the specified Statistic and Threshold. "
  type = string
  default = ""
  
}
variable "cw_threshold" {
  description = "The value against which the specified statistic is compared.  This parameter is required for alarms based on static thresholds, but should not be used for alarms based on anomaly detection models."
  type = number
  default = 60
  
}
variable "cw_evaluation_periods" {
  description = "(Required) The number of periods over which data is compared to the specified threshold."
  type = number
  default = 1
  
}
variable "cw_period" {
  description = "The period in seconds over which the specified statistic is applied. Valid values are 10, 20, 30, or any multiple of 60"
  type = number
  default = 300
  
}

variable "cw_namespace" {
  description = "The namespace for the alarm's associated metric"
  type = string
  default = "AWS/EC2"
  
}

variable "cw_metric_name" {
  description = "The name for the alarm's associated metric."
  type = string
  default = "CPUUtilization"
  
}

variable "cw_statistic" {
  description = "The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum"
  type = string
  default = "Average"
  
}


variable "load_balancer_arn_suffix" {
  type    = string
  default = null
}

variable "target_group_arn_suffix" {
  type    = string
  default = null
}
