output "nat_id" {
  description = "The ID of the NAT Gateway."
  value       = aws_nat_gateway.nat_gw[*].id
}
