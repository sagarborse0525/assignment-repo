variable "alb_name" {
  description = "String variable i.e holds the name of the ALB"
  type        = string
  default     = "test-lb-tf"

}
variable "is_create_alb" {
  description = "Boolean Flag that decides creation of nlb"
  type        = bool
  default     = true
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

variable "is_alb_internal" {
  description = "Boolean variable that checks that it is for internal or not"
  type        = bool
  default     = false
}
variable "alb_type" {
  description = "String variable i.e depicts the type of Load Balancer"
  type        = string
  default     = "application"

}
variable "alb_sg_ids" {
  description = "List of string variable that stores the output of Security Groups Output ids"
  type        = list(string)
  default     = ["sg-1234"]
}

variable "alb_subnet_ids" {
  description = "List of string variable that stores the output of Subnet Output ids"
  type        = list(string)
  default     = ["sub-12345"]
}

variable "alb_idle_timeout" {
  description = "Integer variable i.e time in seconds that the connection is allowed to be idle."
  type        = number
  default     = 60
}

variable "is_enable_http2_enabled" {
  description = "Boolean variable indicates whether HTTP/2 is enabled in application load balancers"
  type        = bool
  default     = false
}

variable "is_alb_deletion_protection_enabled" {
  description = "Boolean variable that decides Protection against deletion is set or not"
  type        = bool
  default     = false
}

variable "env" {
  description = "String variable i.e holds the name of the environment where the resource will be deployed "
  type        = string
  default     = "dev"
}

variable "alb_tags" {
  description = "Map of string variable i.e tags for the Load balancer."
  type        = map(string)
  default     = {}

}
