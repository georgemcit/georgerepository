variable "original_string" {
  default = "George Ibrahim"
}
variable "string_list" {
  default = ["George, Ibrahim"]
}
variable "additional_string" {
  default = "From Syria "
}
variable "total_output_george" {
  type    = list(string)
  default = [724,238,219,291,555]
}
locals {
  incremented_output_george = [
    for value in var.total_output_george : tostring((value) + 10)
  ]
incremented_output_george1 = [
    for value in var.total_output_george : tostring((value) - 10)
  ]
}
output "incremented_output_george_show" {
  value=local.incremented_output_george
}
output "incremented_output_george1_show" {
  value=local.incremented_output_george1
}
