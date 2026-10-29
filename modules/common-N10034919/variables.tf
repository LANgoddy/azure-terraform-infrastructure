variable "resource_group_name" {
  description = "Resource group containing the common services."
  type        = string
}

variable "location" {
  description = "Azure region for the common services."
  type        = string
}

variable "log_analytics_workspace_name" {
  description = "Name of the Log Analytics workspace."
  type        = string
}

variable "recovery_services_vault_name" {
  description = "Name of the Recovery Services vault."
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account for VM boot diagnostics."
  type        = string
}

variable "tags" {
  description = "Common resource tags supplied by the root module."
  type        = map(string)
}
