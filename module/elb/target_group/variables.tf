# Vraiables for ALB 
variable "vpc_id" {
  description = "A string variable that holds the VPC id."
  type        = string
  default     = "vpc-1234343"
}

variable "prefix" {
  description = "Prfix will be used for Name tag"
  type        = string
  default     = ""
}

variable "created_by" {
  description = "String Value to specify Created by Terraform or Manual"
  type        = string
  default     = ""
}

variable "env" {
  description = "String variable i.e holds the name of the environment where the resource will be deployed "
  type        = string
  default     = "dev"
}

variable "alb_tg_name" {
  description = "A list ofvariable that takes the ami id"
  type        = string
  default     = "tf-example-lb-alb-tg"
}
variable "is_alb_tg_enabled" {
  description = "Boolean Flag that selects Target group for NLb / ALb .true->NLB / false->AlB"
  type        = bool
  default     = false
}
variable "alb_tg_port" {
  description = "A list of integer variable that takes the Port Number"
  type        = number
  default     = 80
}
variable "alb_tg_protocol" {
  description = "A list of variable i.e holds the Protocol of the Listner"
  type        = string
  default     = "HTTP"
}

variable "alb_tg_target_type" {
  description = "The type of target that you must specify when registering targets with this target group"
  type        = string
  default     = "instance"
}
variable "alb_tg_tags" {
  description = "Map of string variable i.e tags for the Load balancer."
  type        = map(string)
  default     = {}

}

variable "is_alb_tg_health_check_enabled" {
  description = "Indicates whether health checks are enabled/disabled."
  type        = bool
  default     = true
}
variable "alb_tg_interval" {
  description = "Amount of time, in seconds, between health checks of an individual target. "
  type        = number
  default     = 30
}
variable "alb_tg_path" {
  description = "The destination for the health check request."
  type        = string
  default     = "/"
}
variable "alb_tg_health_check_port" {
  description = "The port to use to connect with the target"
  type        = string
  default     = "traffic-port"
}
variable "alb_tg_health_check_protocol" {
  description = "The protocol to use to connect with the target."
  type        = string
  default     = "HTTP"
}
variable "alb_tg_health_check_timeout" {
  description = "Amount of time, in seconds, during which no response means a failed health check"
  type        = number
  default     = 10
}
variable "alb_tg_health_check_healthy_threshold" {
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy. "
  type        = number
  default     = 3
}
variable "alb_tg_health_check_unhealthy_threshold" {
  description = " The number of consecutive health check failures required before considering the target unhealthy . "
  type        = number
  default     = 3
}
variable "alb_tg_health_check_matcher" {
  description = "The HTTP codes to use when checking for a successful response from a target. "
  type        = string
  default     = "200"
}
