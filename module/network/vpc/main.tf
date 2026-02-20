################################################################################
# VPC
################################################################################

resource "aws_vpc" "this" {
  count = var.create_vpc ? 1 : 0

  cidr_block           = var.vpc_cidr
  instance_tenancy     = var.tenancy
  enable_dns_hostnames = var.enable_dns_hostname_support
  enable_dns_support   = var.enable_dns_support

  tags = merge(
    {
      "Name" = var.vpc_name != "" && var.vpc_name != null && var.prefix_name != "" && var.prefix_name != null && var.createdBy != "" && var.createdBy != "" && var.env_name != "" && var.env_name != null ? lower(format("%s-%s-%s-%s", var.prefix_name, var.env_name, var.vpc_name, var.createdBy)) : lover(var.vpc_name)
    },
    var.vpc_tags,
    var.mandatory_tags,
  )
}