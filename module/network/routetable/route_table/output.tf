output "rt_table_id" {
  description = "An output variable where id of the route table will get stored"
  value       = var.create_route_table ? aws_route_table.route_table[0].id : 0
}