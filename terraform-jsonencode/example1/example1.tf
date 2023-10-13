variable "json_input" {
  description = "Path to the JSON input file"
  type        = string
}

locals {
  input_data = jsondecode(file(var.json_input))
}

output "name" {
  value = local.input_data.name
}

output "age" {
  value = local.input_data.age
}

output "city" {
  value = local.input_data.city
}