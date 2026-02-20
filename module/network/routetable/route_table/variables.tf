#Variables for Route Table
variable "create_route_table" {
  description = "A boolean variable i.e checks VPC is created or not."
  type        = bool
  default     = true
}
variable "vpc_id" {
  description = "A string variable i.e ID of the VPC created or known"
  type        = string
  default     = "vpc-12343"
}

variable "route_table_name" {
  description = "A string variable i.e name of the route table"
  type        = string
  default     = ""
}

variable "route_table_tags" {
  description = "route table key values tags"
  type        = map(string)
  default     = {}

}


variable "prefix_name" {
  description = "Prefix name."
  type        = string
  default     = ""
}

variable "createdBy" {
  description = "CreatedBy terrafrm name."
  type        = string
  default     = ""
}

variable "env_name" {
  description = "Environment name."
  type        = string
  default     = ""
}

variable "app_name" {
  description = "Application name."
  type        = string
  default     = ""
}

variable "mandatory_tags" {
  description = "A map of tags for the VPCs"
  type        = map(string)
  default     = {}
}
