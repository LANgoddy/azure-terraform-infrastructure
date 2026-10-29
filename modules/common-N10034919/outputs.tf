output "log_analytics_workspace_name" {
  description = "Name of the Log Analytics workspace."
  value       = azurerm_log_analytics_workspace.this.name
}

output "recovery_services_vault_name" {
  description = "Name of the Recovery Services vault."
  value       = azurerm_recovery_services_vault.this.name
}

output "storage_account_name" {
  description = "Name of the boot diagnostics storage account."
  value       = azurerm_storage_account.this.name
}

output "storage_account_primary_blob_endpoint" {
  description = "Storage endpoint used for VM boot diagnostics."
  value       = azurerm_storage_account.this.primary_blob_endpoint
}
