variable "create_rtb_assoc" {
  type    = bool
  default = false

}

variable "subnet_id" {
  description = "value"
  type        = list(string)
  default     = ["Sub-123123"]

}

variable "route_table_id" {
  description = "value"
  type        = string
  default     = ""

}
