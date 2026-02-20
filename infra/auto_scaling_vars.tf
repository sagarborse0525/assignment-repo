variable "lt_name" {
  description = "Launch template name"
  type        = string
  default     = ""
}

variable "asg_name" {
  description = "ASG name"
  type        = string
  default     = ""
}
variable "iam_instance_profile_name" {
  description = "IAM instance profile role name"
  type        = string
  default     = "iam-profile"
}
