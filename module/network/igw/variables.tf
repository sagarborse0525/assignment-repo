variable "create_igw" {
  type    = bool
  default = false
}

variable "vpc_id" {
  description = "AWS VPC ID"
  type        = string
  default     = "vpc-123"
}

variable "igw_name" {
  description = "Internet gateway name"
  type        = string
  default     = ""

}

variable "igw_tags" {
  description = "Additional tags for the internet gateway"
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
