##----------------------------------------------------------------------------- 
## Subnet variables     
##-----------------------------------------------------------------------------

#Variables for Subnet
variable "create_private_subnet" {
  description = "A boolean variable i.e checks Public Subnets are created or not"
  type        = bool
  default     = true
}

variable "create_public_subnet" {
  description = "A boolean variable i.e checks Public Subnets are created or not"
  type        = bool
  default     = true
}

variable "vpc_id" {
  description = "AWS VPC ID"
  type        = string
  default     = "vpc-123"
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = ["10.0.128.0/20", "10.0.144.0/20"]
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = ["10.0.0.0/20", "10.0.16.0/20"]

}

variable "private_subnet_names" {
  description = "Explicit values to use in the Name tag on private subnets. If empty, Name tags are generated"
  type        = list(string)
  default     = ["pvt-sub1", "pvt-sub2"]
}

variable "public_subnet_names" {
  description = "Explicit values to use in the Name tag on public subnets. If empty, Name tags are generated"
  type        = list(string)
  default     = ["pub-sub1", "pub-sub2"]
}

variable "private_subnet_tags" {
  description = "Additional tags for the private subnets"
  type        = map(string)
  default     = null
}

variable "public_subnet_tags" {
  description = "Additional tags for the public subnets"
  type        = map(string)
  default     = null

}

variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]

}

variable "map_public_ip_on_launch" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is `false`"
  type        = bool
  default     = true
}


variable "prefix_name" {
  description = "prefix_name name."
  type        = string
  default     = null
}

variable "createdBy" {
  description = "CreatedBy terrafrm name."
  type        = string
  default     = "tf"
}

variable "env_name" {
  description = "env_nameironment name."
  type        = string
  default     = null
}

variable "app_name" {
  description = "app_namelication name."
  type        = string
  default     = null
}

variable "mandatory_tags" {
  description = "A map of tags for the VPCs"
  type        = map(string)
  default     = null
}
