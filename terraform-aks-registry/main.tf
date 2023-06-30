module "aks_example" {
  source                               = "Azure/aks/azurerm"
  version                              = "6.2.0"
  prefix                               = "test"
  resource_group_name                  = "aks-test-rg"
  admin_username                       = "testaksadmin"
  azure_policy_enabled                 = true
  cluster_log_analytics_workspace_name = "test-aks-law"
  cluster_name                         = "jr-test-aks"
  ingress_application_gateway_name     = "jr-test-aks-appgw"
  ingress_application_gateway_enabled  = true
  location                             = "uksouth"
  log_retention_in_days                = "365"
}