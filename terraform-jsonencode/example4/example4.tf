# Define a variable with configuration data
variable "app_config" {
  type = map(string)
  default = {
    name = "Yoda",
    age  = "900",
    city = "Dagobah System"
  }
}

# Render the template
data "template_file" "app_config_template" {
  template = file("template.tpl")
  vars = {
    app_config = jsonencode(var.app_config)
  }
}

# Create a local file to save the generated JSON config
resource "local_file" "app_config" {
  filename = "app_config.json"
  content  = data.template_file.app_config_template.rendered
}