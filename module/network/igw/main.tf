resource "aws_internet_gateway" "igw" {
  count  = var.create_igw ? 1 : 0
  vpc_id = var.vpc_id

  tags = merge(
    {
      "Name" = var.igw_name != "" && var.igw_name != null && var.prefix_name != "" && var.prefix_name != null && var.createdBy != "" && var.createdBy != "" && var.env_name != "" && var.env_name != null ? lower(format("%s-%s-%s-%s", var.prefix_name, var.env_name, var.igw_name, var.createdBy)) : lower(var.igw_name)
    },
    var.igw_tags,
    var.mandatory_tags,
  )
}