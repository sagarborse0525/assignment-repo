variable "create_vpc" {
  description = "variable for dependency"
  type        = bool
  default     = false
}

variable "sg_name" {
  description = "name of the security group"
  type        = string
  default     = "nsg_name"
}

variable "prefix" {
  description = "Prfix will be used for Name tag"
  type        = string
  default     = ""
}

variable "description" {
  description = "description of the security group"
  type        = string
  default     = "This is a network security group creation"
}

variable "vpc_id" {
  description = "ID of the vpc where the SG to be attached"
  type        = string
  default     = "vpc-123456"
}

variable "ingress" {
  description = "Security Group Inbound rules, defined as list of objects"
  type        = any
  default     = []
}

variable "egress" {
  description = "Security Group Outbound rules, defined as list of objects"
  type        = any
  default     = []
}

variable "sg_tags" {
  description = "Security Group Tags"
  type        = map(string)
  default     = {}
}

variable "env" {
  description = "Environment tag"
  type        = string
  default     = "dev"
}

variable "created_by" {
  description = "String Value to specify Created by Terraform or Manual"
  type        = string
  default     = ""
}




