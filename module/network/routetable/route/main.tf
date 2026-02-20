resource "aws_route" "route" {
  count = length(var.destination)

  route_table_id         = var.rt_table_id
  destination_cidr_block = var.destination[count.index]


  # internet gateway or a virtual private gateway

  gateway_id = var.gateway_id
}