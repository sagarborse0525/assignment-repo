variable "rt_table_id" {
  type    = string
  default = "rtb-123456"

}
variable "destination" {
  type    = string
  default = "0.0.0.0/0"

}
variable "nat_gateway_id" {
  type    = list(string)
  default = ["nat-12345"]
}