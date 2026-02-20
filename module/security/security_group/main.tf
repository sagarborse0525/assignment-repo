resource "aws_security_group" "vpc_sg" {
  count = var.create_vpc ? 1 : 0

  name        = format("%s-%s-%s-%s", var.prefix, var.env, var.sg_name, var.created_by)
  description = var.description
  vpc_id      = var.vpc_id

  tags = merge({

    Name = var.sg_name != "" && var.sg_name != null && var.prefix != "" && var.prefix != null && var.created_by != "" && var.created_by != "" && var.env != "" && var.env != null ? lower(format("%s-%s-%s-%s", var.prefix, var.env, var.sg_name, var.created_by)) : lover(var.sg_name)
    },
    var.sg_tags
  )
}




