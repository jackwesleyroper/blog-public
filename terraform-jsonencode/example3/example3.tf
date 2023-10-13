variable "json_input" {
  description = "JSON input"
  type        = string
  default     = ""
}

locals {
  input_data = jsondecode(var.json_input)
}

output "name" {
  value = local.input_data["name"]
}

output "age" {
  value = local.input_data["age"]
}

output "city" {
  value = local.input_data["city"]
}