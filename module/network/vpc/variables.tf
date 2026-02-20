################################################################################
# VPC
################################################################################

variable "create_vpc" {
  description = "Controls if VPC should be created"
  type        = bool
  default     = false

}

variable "vpc_name" {
  description = "value"
  type        = string
  default     = "default-vpc"

}

variable "vpc_cidr" {
  description = "value"
  type        = string
  default     = "10.0.0.0/16"

}

variable "tenancy" {
  description = "value"
  type        = string
  default     = "default"

}

variable "enable_dns_support" {
  description = "value"
  type        = bool
  default     = true

}

variable "enable_dns_hostname_support" {
  description = "value"
  type        = bool
  default     = false

}

variable "vpc_tags" {
  description = "A map of tags for the VPCs"
  type        = map(string)
  default     = {}

}

variable "prefix_name" {
  description = "prefix_name name."
  type        = string
  default     = ""
}

variable "createdBy" {
  description = "CreatedBy terrafrm name."
  type        = string
  default     = ""
}

variable "env_name" {
  description = "env_nameironment name."
  type        = string
  default     = ""
}

variable "app_name" {
  description = "app_namelication name."
  type        = string
  default     = ""
}

variable "mandatory_tags" {
  description = "A map of tags for the VPCs"
  type        = map(string)
  default     = {}
}
