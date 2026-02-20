variable "prefix_name" {}
variable "createdBy" {}
variable "app_name" {}
variable "env_name" {}
variable "mandatory_tags" {}
variable "region" {}


variable "create_vpc" {}
variable "vpc_name" {}
variable "vpc_cidr" {}
variable "tenancy" {}
variable "enable_dns_hostname_support" {}
variable "enable_dns_support" {}
variable "vpc_tags" {}

# #############################################
# # IGW Variables
# #############################################
variable "create_igw" {}
variable "igw_name" {}
variable "igw_tags" {}

# #############################################
# # NAT Gateway Variables
# #############################################

variable "create_nat_gateway_1a" {}
variable "nat_gw_name_1a" {}
variable "eip_1a" {}
variable "pub_subnet_id_1a" {}
variable "connectivity_type_1a" {}
variable "nat_gw_tags_1a" {}

variable "create_nat_gateway_1b" {}
variable "nat_gw_name_1b" {}
variable "eip_1b" {}
variable "pub_subnet_id_1b" {}
variable "connectivity_type_1b" {}
variable "nat_gw_tags_1b" {}

# ############################################
# # Elastic IP Address
# ############################################
variable "create_eip" {}
variable "eip_name" {}
variable "eip_associate_instance_id" {}
variable "eip_tags" {}

# #############################################
# # public subnets Variables
# #############################################
variable "create_public_subnet" {}
variable "azs" {}
variable "public_subnets" {}
variable "map_public_ip_on_launch" {}
variable "public_subnet_names" {}
variable "public_subnet_tags" {}
# #############################################
# # private subnets Variables
# #############################################
variable "create_private_subnet" {}
variable "private_subnets" {}
variable "private_subnet_names" {}
variable "private_subnet_tags" {}
# #############################################
# # Route Table Variables
# #############################################
variable "create_private_route_table_1a" {}
variable "private_route_table_name_1a" {}
variable "private_route_table_tags_1a" {}

variable "create_private_route_table_1b" {}
variable "private_route_table_name_1b" {}
variable "private_route_table_tags_1b" {}

variable "create_public_route_table_1a" {}
variable "public_route_table_name_1a" {}
variable "public_route_table_tags_1a" {}

variable "create_public_route_table_1b" {}
variable "public_route_table_name_1b" {}
variable "public_route_table_tags_1b" {}
# #############################################
# # Route Table Subnets Association
# #############################################
variable "create_private_rtb_assoc" {}
variable "create_public_rtb_assoc" {}

# #############################################
# # AWS Route
# #############################################
variable "destination" {}

# # VPCE routes
variable "destination_1a" {}
variable "destination_1b" {}
variable "nat_gw_route_destination_1a" {}
variable "nat_gw_route_destination_1b" {}