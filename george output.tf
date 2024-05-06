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
  value = replace(var.original_string, "George", "Julian")
}
output "substring_example" {
  value = substr(var.original_string, 6, -1)
}
output "split_example" {
  value = split(" ", var.original_string)
}
output "reverse_example" {
  value = join("", reverse(split("", var.original_string)))
}
locals {
  contains_keyword = contains(split(" ", var.original_string), "Ibrahim")
}
output "contains_keyword_output"{
    value=local.contains_keyword
}
output "string_contains_no_sample" {
  value = local.contains_keyword ? "String contains 'George'" : "String does not contain 'Julian'"
}

