output "assoc_id" {
  description = "The ID of the association"
  value       = var.create_rtb_assoc ? aws_route_table_association.rtb_assoc.*.id : null

}