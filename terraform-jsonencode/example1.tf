variable "json_input" {
  description = "Path to the JSON input file"
  type        = string
}

data "external" "json_data" {
  program = ["cat", var.json_input]
}

locals {
  input_data = jsondecode(data.external.json_data.result)
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