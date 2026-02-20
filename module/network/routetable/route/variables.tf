variable "rt_table_id" {
  type    = string
  default = "rtb-123456"

}
variable "destination" {
  type    = list(string)
  default = []

}
variable "gateway_id" {
  type    = string
  default = "igw-0aa8572609"
}