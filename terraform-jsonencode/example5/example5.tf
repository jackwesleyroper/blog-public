# Define a list of items
variable "items" {
  type    = list(string)
  default = ["Yoda", "Darth Vader", "Salacious Crumb"]
}

# Render the template
data "template_file" "items_template" {
  template = file("template.tpl")
  vars = {
    items_json = jsonencode([for item in var.items : { name = item }])
  }
}

# Create a local file to save the generated JSON
resource "local_file" "items_json" {
  filename = "items.json"
  content  = data.template_file.items_template.rendered
}