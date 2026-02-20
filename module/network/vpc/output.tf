################################################################################
# VPC
################################################################################

output "vpc_id" {
  description = "An output variable where id of the VPCs will get stored"
  value       = var.create_vpc ? aws_vpc.this[0].id : 0

}

output "vpc_count" {
  description = "Number of VPC created"
  value       = var.create_vpc ? length(aws_vpc.this[0].id) : 0

}

output "vpc_arn" {
  description = "Amazon Resource Name (ARN) of VPC"
  value       = var.create_vpc ? aws_vpc.this[0].arn : 0

}

output "default_route_table_id" {
  description = "Default Route table ID"
  value       = var.create_vpc ? aws_vpc.this[0].default_route_table_id : 0

}

output "default_network_acl_id" {
  description = "Default NACL"
  value       = var.create_vpc ? aws_vpc.this[0].default_network_acl_id : 0

}

output "default_security_group_id" {
  description = "Default Security Group ID"
  value       = var.create_vpc ? aws_vpc.this[0].default_security_group_id : 0

}

output "vpc_cidr" {
  description = "Default Security Group ID"
  value       = var.create_vpc ? aws_vpc.this[0].cidr_block : 0

}
