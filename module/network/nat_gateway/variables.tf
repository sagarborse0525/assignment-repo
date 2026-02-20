variable "create_nat_gateway" {
  type    = bool
  default = false
}

variable "eip" {
  description = "(Optional) The Allocation ID of the Elastic IP address for the NAT Gateway"
  type        = string
  default     = ""
}

variable "pub_subnet_id" {
  description = "(Required) The Subnet ID of the subnet in which to place the NAT Gateway."
  type        = list(string)
  default     = ["subnet-071e5d42a68a"]
}

variable "nat_gw_name" {
  description = "Nat Gateway Name."
  type        = string
  default     = "nat-gw"
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

variable "nat_gw_tags" {
  description = "A map of tags for the VPCs"
  type        = map(string)
  default     = {}
}

variable "connectivity_type" {
  description = "(Optional) Connectivity type for the NAT Gateway. Valid values are private and public. Defaults to public."
  type        = string
  default     = "public"
}