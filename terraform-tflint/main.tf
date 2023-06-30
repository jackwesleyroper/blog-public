variable "region" {
  type = map(any)
  default = {
    "uk1" = {
      "region" = "uksouth",
    },
    "uk2" = {
      "region" = "ukwest",
    },
    "us" = {
      "region" = "eastus",
    }
    "us2" = {
      "region" = "eastus2",
    }
  }
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

variable "cidr" {
  default = "172.16.0.0/20"
}