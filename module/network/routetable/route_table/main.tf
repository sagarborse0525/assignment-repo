resource "aws_route_table" "route_table" {
  count = var.create_route_table ? 1 : 0

  vpc_id = var.vpc_id

  tags = merge(
    {
      "Name" = var.route_table_name != null && var.route_table_name != "" && var.prefix_name != "" && var.prefix_name != null && var.createdBy != "" && var.createdBy != "" && var.env_name != "" && var.env_name != null ? lower(format("%s-%s-%s-%s", var.prefix_name, var.env_name, var.route_table_name, var.createdBy)) : lower(var.route_table_name)
    },
    var.route_table_tags,
    var.mandatory_tags,
  )
}