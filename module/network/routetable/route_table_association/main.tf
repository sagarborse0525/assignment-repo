resource "aws_route_table_association" "rtb_assoc" {
  count          = var.create_rtb_assoc && length(var.subnet_id) > 0 ? length(var.subnet_id) : 0
  subnet_id      = var.subnet_id[count.index]
  route_table_id = var.route_table_id
}