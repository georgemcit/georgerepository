variable "original_string" {​
  default = "Hello World"​
}
output "replaced_string" {​
  value = replace(var.original_string, "Hello", "Hi")​
}
