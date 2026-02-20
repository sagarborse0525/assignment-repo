output "pub_subnet_id" {
  description = "An output variable where id of the Subnets will get stored."
  value       = aws_subnet.public[*].id
}

output "pvt_subnet_id" {
  description = "An output variable where id of the Subnets will get stored."
  value       = aws_subnet.private[*].id
}

output "pub_subnet_count" {
  description = "An output variable where id of the Subnets will get stored."
  value       = length(aws_subnet.public[*].id)
}

output "pvt_subnet_count" {
  description = "An output variable where id of the Subnets will get stored."
  value       = length(aws_subnet.private[*].id)
}

output "pub_subnet_arn" {
  description = "An output variable where arn of the Subnets will get stored."
  value       = var.create_public_subnet ? aws_subnet.public[*].arn : null
}

output "pvt_subnet_arn" {
  value = var.create_private_subnet ? aws_subnet.private[*].arn : null
}

output "pvt_subnet_cidr" {
  value = var.create_private_subnet ? aws_subnet.private[*].cidr_block : null
}

output "pub_subnet_cidr" {
  value = var.create_public_subnet ? aws_subnet.public[*].cidr_block : null
}