################################################################################
# Elastic IP
################################################################################

resource "aws_eip" "eip" {
  count    = var.create_eip && length(var.eip_name) > 0 ? length(var.eip_name) : 0
  instance = var.eip_associate_instance_id

  tags = merge(
    {
      "Name" = var.eip_name[count.index] != "" && var.eip_name[count.index] != "" && var.prefix_name != "" && var.prefix_name != null && var.createdBy != "" && var.createdBy != "" && var.env_name != "" && var.env_name != null ? lower(format("%s-%s-%s-%s", var.prefix_name, var.env_name, var.eip_name[count.index], var.createdBy)) : lower(var.eip_name[count.index])

    },
    var.mandatory_tags,
    var.eip_tags,
  )
}