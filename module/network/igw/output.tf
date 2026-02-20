output "igw_id" {
  description = "An output variable where id of the Internet Gateway will get stored"
  value       = var.create_igw ? aws_internet_gateway.igw[0].id : ""
}
output "igw_count" {
  description = "An output variable where number of the Internet Gateway will get stored"
  value       = length(aws_internet_gateway.igw.*.id)
}