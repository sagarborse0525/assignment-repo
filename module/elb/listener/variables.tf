variable "lb_listener_ports" {
  description = "An integer variable that takes the pors number"
  type        = list(number)
  default     = [80]
}

variable "lb_arn" {
  description = "A string variable that takes the  output of LB i.e ARN of the LB"
  type        = string
  default     = ""
}

variable "listener_protocol" {
  description = "A string variable i.e holds the Protocol of the Listner"
  type        = list(string)
  default     = ["TCP"]
}

variable "listener_ssl_policy" {
  description = "A string varaible i.e name of the SSL Policy for the listener"
  type        = string
  default     = "ELBSecurityPolicy-2016-08"
}

variable "listener_certificate_arn" {
  description = "A string variable i.e ARN of the default SSL server certificate."
  type        = string
  default     = ""
}

variable "target_group_arn" {
  description = "A string variable that takes the arn of the Target Group"
  type        = string
  default     = ""
}

variable "action_type" {
  description = "A string variable i.e type of the action listener  that will perform i.e forward, redirect, fixed-response, authenticate-cognito and authenticate-oidc. "
  type        = string
  default     = "forward"
}




