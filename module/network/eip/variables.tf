################################################################################
# Elastic IP
################################################################################

variable "create_eip" {
  description = "Determines whether a public EIP will be created and associated with the instance."
  type        = bool
  default     = false
}

variable "eip_name" {
  description = "Name of the EIP resource"
  type        = list(string)
}

variable "eip_associate_instance_id" {
  description = "EC2 instance ID"
  type        = string
  default     = null
}

variable "eip_tags" {
  description = "A map of additional tags to add to the eip"
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
