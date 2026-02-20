output "sg_id" {
  description = "ID of the security group rule"
  value       = var.create_vpc ? aws_security_group.vpc_sg[0].id : null
}