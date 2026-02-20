variable "target_group_arn" {
  description = "A string variable that takes the arn of the Target Group"
  type        = list(string)
  default     = []
}
variable "tg_target_id" {
  description = "A List of string variable that holds the Instance Id(EC2)/ IP /Lambda id"
  type        = list(string)
  default     = []
}
variable "tg_attach_port" {
  description = "An integer variable that takes the Port Number"
  type        = number
  default     = 80
}
variable "availability_zone" {
  description = "The Availability Zone where the IP address of the target is to be registered. If the private ip address is outside of the VPC scope, this value must be set to 'all'."
  type        = string
  default     = null
}


