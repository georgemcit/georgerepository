output "string_length" {
  value = length(var.original_string)
}
output "uppercase_string" {
  value = upper(var.original_string)
}
output "lowercase_string" {
  value = lower(var.original_string)
}
output "concatenated_string" {
  value = "${var.additional_string}${var.original_string}"
}
output "replaced_string" {
  value = replace(var.original_string, "HELLO", "HI")
}
output "substring_example" {
  value = substr(var.original_string, 6, -1)
}
output "split_example" {
  value = split(" ", var.original_string)
}
