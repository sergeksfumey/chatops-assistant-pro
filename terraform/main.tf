provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "chatops" {
  name     = "rg-chatops"
  location = "East US"
}

resource "azurerm_storage_account" "chatops" {
  name                     = "chatopsfuncsa12345"  # must be globally unique
  resource_group_name      = azurerm_resource_group.chatops.name
  location                 = azurerm_resource_group.chatops.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_log_analytics_workspace" "chatops" {
  name                = "log-chatops-workspace"
  location            = azurerm_resource_group.chatops.location
  resource_group_name = azurerm_resource_group.chatops.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_service_plan" "chatops" {
  name                = "chatops-func-plan"
  location            = azurerm_resource_group.chatops.location
  resource_group_name = azurerm_resource_group.chatops.name
  os_type             = "Linux"
  sku_name            = "Y1"
}

resource "azurerm_linux_function_app" "chatops" {
  name                       = "chatops-linux-func-app"
  location                   = azurerm_resource_group.chatops.location
  resource_group_name        = azurerm_resource_group.chatops.name
  service_plan_id            = azurerm_service_plan.chatops.id
  storage_account_name       = azurerm_storage_account.chatops.name
  storage_account_access_key = azurerm_storage_account.chatops.primary_access_key

  site_config {
    application_stack {
      python_version = "3.9"
    }
  }

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME"    = "python"
    "AzureWebJobsStorage"         = azurerm_storage_account.chatops.primary_connection_string
    "LOG_ANALYTICS_WORKSPACE_ID" = azurerm_log_analytics_workspace.chatops.workspace_id
  }
}