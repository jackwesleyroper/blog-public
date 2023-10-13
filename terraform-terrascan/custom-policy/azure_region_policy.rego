package main

import input.tfplan as tfplan

default allow = false

allowed_regions = ["UK South", "UK West"]

# Iterate over all Azure resources in the Terraform plan.
azure_resources[resource_name] {
    resource_name = input.tfplan.resource_changes[_].address
    input.tfplan.resource_changes[_].type == "azurerm_resource"
}

# Check if the region of each Azure resource is allowed.
allow {
    resource_name
    resource_config := input.tfplan.resource_changes[resource_name].change.after
    resource_config.location == allowed_region
    allowed_region = allowed_regions[_]
}