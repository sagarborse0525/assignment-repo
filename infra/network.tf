# ############################################
# # AWS VPC 
# ############################################
module "create_vpc" {
  source = "../module/network/vpc"

  create_vpc                  = var.create_vpc
  vpc_name                    = var.vpc_name
  vpc_cidr                    = var.vpc_cidr
  tenancy                     = var.tenancy
  enable_dns_hostname_support = var.enable_dns_hostname_support
  enable_dns_support          = var.enable_dns_support
  vpc_tags                    = var.vpc_tags
  prefix_name                 = var.prefix_name
  createdBy                   = var.createdBy
  env_name                    = var.env_name
  mandatory_tags              = var.mandatory_tags

}

# ############################################
# # AWS VPC SUBNET
# ############################################


module "create_subnet" {
  source                  = "../module/network/subnet"
  create_private_subnet   = var.create_private_subnet
  create_public_subnet    = var.create_public_subnet
  private_subnet_names    = var.private_subnet_names
  public_subnet_names     = var.public_subnet_names
  public_subnet_tags      = var.public_subnet_tags
  private_subnet_tags     = var.private_subnet_tags
  public_subnets          = var.public_subnets
  private_subnets         = var.private_subnets
  map_public_ip_on_launch = var.map_public_ip_on_launch
  vpc_id                  = module.create_vpc.vpc_id
  azs                     = var.azs
  prefix_name             = var.prefix_name
  createdBy               = var.createdBy
  env_name                = var.env_name
  mandatory_tags          = var.mandatory_tags

}

# #############################################################
# # IGW
# #############################################################

module "create_igw" {
  source = "../module/network/igw"

  create_igw     = var.create_igw
  igw_name       = var.igw_name
  vpc_id         = module.create_vpc.vpc_id
  igw_tags       = var.igw_tags
  prefix_name    = var.prefix_name
  createdBy      = var.createdBy
  env_name       = var.env_name
  mandatory_tags = var.mandatory_tags
}

# ############################################
# # Elastic IP Address
# ############################################
module "create_eip" {
  source                    = "../module/network/eip"
  create_eip                = var.create_eip
  eip_name                  = var.eip_name
  eip_associate_instance_id = var.eip_associate_instance_id
  eip_tags                  = var.eip_tags
  prefix_name               = var.prefix_name
  createdBy                 = var.createdBy
  env_name                  = var.env_name
  mandatory_tags            = var.mandatory_tags
}

# #############################################################
# # NAT
# #############################################################

module "create_nat_gw_1a" {
  source             = "../module/network/nat_gateway"
  create_nat_gateway = var.create_nat_gateway_1a
  nat_gw_name        = var.nat_gw_name_1a
  eip                = try(module.create_eip.id[0], var.eip_1a)
  pub_subnet_id      = [try(module.create_subnet.pub_subnet_id[0], var.pub_subnet_id_1a)]
  connectivity_type  = var.connectivity_type_1a
  prefix_name        = var.prefix_name
  createdBy          = var.createdBy
  env_name           = var.env_name
  mandatory_tags     = var.mandatory_tags
  nat_gw_tags        = var.nat_gw_tags_1a
}

module "create_nat_gw_1b" {
  source             = "../module/network/nat_gateway"
  create_nat_gateway = var.create_nat_gateway_1b
  nat_gw_name        = var.nat_gw_name_1b
  eip                = try(module.create_eip.id[1], var.eip_1b)
  pub_subnet_id      = [try(module.create_subnet.pub_subnet_id[1], var.pub_subnet_id_1b)]
  connectivity_type  = var.connectivity_type_1b
  prefix_name        = var.prefix_name
  createdBy          = var.createdBy
  env_name           = var.env_name
  mandatory_tags     = var.mandatory_tags
  nat_gw_tags        = var.nat_gw_tags_1b
}

# ############################################
# # VPC Route Table
# ############################################

module "create_private_rtb_1a" {
  source = "../module/network/routetable/route_table"

  create_route_table = var.create_private_route_table_1a
  vpc_id             = module.create_vpc.vpc_id
  route_table_name   = var.private_route_table_name_1a
  route_table_tags   = var.private_route_table_tags_1a
  prefix_name        = var.prefix_name
  createdBy          = var.createdBy
  env_name           = var.env_name
  mandatory_tags     = var.mandatory_tags
}

module "create_private_rtb_1b" {
  source = "../module/network/routetable/route_table"

  create_route_table = var.create_private_route_table_1b
  vpc_id             = module.create_vpc.vpc_id
  route_table_name   = var.private_route_table_name_1b
  route_table_tags   = var.private_route_table_tags_1b
  prefix_name        = var.prefix_name
  createdBy          = var.createdBy
  env_name           = var.env_name
  mandatory_tags     = var.mandatory_tags
}

module "create_public_rtb_1a" {
  source = "../module/network/routetable/route_table"

  create_route_table = var.create_public_route_table_1a
  vpc_id             = module.create_vpc.vpc_id
  route_table_name   = var.public_route_table_name_1a
  route_table_tags   = var.public_route_table_tags_1a
  prefix_name        = var.prefix_name
  createdBy          = var.createdBy
  env_name           = var.env_name
  mandatory_tags     = var.mandatory_tags

}

module "create_public_rtb_1b" {
  source = "../module/network/routetable/route_table"

  create_route_table = var.create_public_route_table_1b
  vpc_id             = module.create_vpc.vpc_id
  route_table_name   = var.public_route_table_name_1b
  route_table_tags   = var.public_route_table_tags_1b
  prefix_name        = var.prefix_name
  createdBy          = var.createdBy
  env_name           = var.env_name
  mandatory_tags     = var.mandatory_tags

}

# ############################################
# # Subnets Association
# ############################################
module "create_private_subnet_association_1a" {
  source           = "../module/network/routetable/route_table_association"
  create_rtb_assoc = var.create_private_rtb_assoc
  subnet_id        = [module.create_subnet.pvt_subnet_id[0]]
  route_table_id   = module.create_private_rtb_1a.rt_table_id
}

module "create_private_subnet_association_1b" {
  source           = "../module/network/routetable/route_table_association"
  create_rtb_assoc = var.create_private_rtb_assoc
  subnet_id        = [module.create_subnet.pvt_subnet_id[1]]
  route_table_id   = module.create_private_rtb_1b.rt_table_id
}

# #--------------------- Public Subnets Associations-------------------
module "create_public_subnet_association_1a" {
  source           = "../module/network/routetable/route_table_association"
  create_rtb_assoc = var.create_public_rtb_assoc
  subnet_id        = [module.create_subnet.pub_subnet_id[0]]
  route_table_id   = module.create_public_rtb_1a.rt_table_id

}
module "create_public_subnet_association_1b" {
  source           = "../module/network/routetable/route_table_association"
  create_rtb_assoc = var.create_public_rtb_assoc
  subnet_id        = [module.create_subnet.pub_subnet_id[1]]
  route_table_id   = module.create_public_rtb_1b.rt_table_id
}

# ############################################
# # AWS Internet Gateway Routes
# ############################################

module "create_igw_route_1a" {
  source      = "../module/network/routetable/route"
  rt_table_id = module.create_public_rtb_1a.rt_table_id
  destination = var.destination
  gateway_id  = module.create_igw.igw_id
}

module "create_igw_route_1b" {
  source      = "../module/network/routetable/route"
  rt_table_id = module.create_public_rtb_1b.rt_table_id
  destination = var.destination
  gateway_id  = module.create_igw.igw_id

}

module "create_nat_gw_route_1a" {
  source = "../module/network/routetable/nat_route"
  # rt_table_id    = module.create_firewall_rtb_1a.rt_table_id   # Decommission Firewall route in firewall RT
  rt_table_id    = module.create_private_rtb_1a.rt_table_id
  destination    = var.nat_gw_route_destination_1a
  nat_gateway_id = module.create_nat_gw_1a.nat_id
}

module "create_nat_gw_route_1b" {
  source = "../module/network/routetable/nat_route"
  # rt_table_id    = module.create_firewall_rtb_1b.rt_table_id  # Decommission Firewall route in firewall RT
  rt_table_id    = module.create_private_rtb_1b.rt_table_id
  destination    = var.nat_gw_route_destination_1b
  nat_gateway_id = module.create_nat_gw_1b.nat_id
}