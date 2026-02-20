############################################
# AWS VPC SUBNET
############################################
resource "aws_subnet" "private" {
  count             = var.create_private_subnet && length(var.private_subnets) > 0 ? length(var.private_subnets) : 0
  vpc_id            = var.vpc_id
  availability_zone = element(var.azs, count.index)
  cidr_block        = var.private_subnets[count.index]

  tags = merge(
    {
      "Name" = var.create_private_subnet && var.prefix_name != "" && var.prefix_name != null && var.createdBy != "" && var.createdBy != "" && var.env_name != "" && var.env_name != null ? lower(format("%s-%s-%s-%s", var.prefix_name, var.env_name, var.private_subnet_names[count.index], var.createdBy)) : lower("${var.private_subnet_names[count.index]}-${var.azs[count.index]}")
    },
    var.private_subnet_tags,
    var.mandatory_tags,
  )
}


resource "aws_subnet" "public" {
  count                   = var.create_public_subnet && length(var.public_subnets) > 0 ? length(var.public_subnets) : 0
  vpc_id                  = var.vpc_id
  availability_zone       = element(var.azs, count.index)
  cidr_block              = var.public_subnets[count.index]
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = merge(
    {
      "Name" = var.create_public_subnet && var.prefix_name != "" && var.prefix_name != null && var.createdBy != "" && var.createdBy != "" && var.env_name != "" && var.env_name != null ? lower(format("%s-%s-%s-%s", var.prefix_name, var.env_name, var.public_subnet_names[count.index], var.createdBy)) : lower("${var.public_subnet_names[count.index]}-${var.azs[count.index]}")
    },
    var.public_subnet_tags,
    var.mandatory_tags,
  )
}