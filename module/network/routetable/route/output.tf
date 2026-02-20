output "route_id" {
  description = "variable which stores id of the route"
  value       = length(var.destination) > 0 ? aws_route.route[0].id : null
}