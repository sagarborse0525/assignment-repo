resource "aws_nat_gateway" "nat_gw" {
  count             = var.create_nat_gateway ? 1 : 0
  allocation_id     = var.eip
  subnet_id         = var.pub_subnet_id[count.index]
  connectivity_type = var.connectivity_type

  tags = merge(
    {
      "Name" = var.nat_gw_name != "" && var.nat_gw_name != null && var.prefix_name != "" && var.prefix_name != null && var.createdBy != "" && var.createdBy != "" && var.env_name != "" && var.env_name != null ? lower(format("%s-%s-%s-%s", var.prefix_name, var.env_name, var.nat_gw_name, var.createdBy)) : lower(var.nat_gw_name)
    },
    var.mandatory_tags,
    var.nat_gw_tags,

  )
}