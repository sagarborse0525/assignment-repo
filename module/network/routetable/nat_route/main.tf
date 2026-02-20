resource "aws_route" "nat_route" {
  route_table_id         = var.rt_table_id
  destination_cidr_block = var.destination
  nat_gateway_id         = var.nat_gateway_id[0]
}