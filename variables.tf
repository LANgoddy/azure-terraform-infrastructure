variable "resource_group_name" {
  description = "Name of the project resource group."
  type        = string
  default     = "4919-RG"
}

variable "location" {
  description = "Azure region for the project infrastructure."
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network."
  type        = string
  default     = "4919-VNET"
}

variable "vnet_address_space" {
  description = "Address ranges for the virtual network."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "Name of the subnet."
  type        = string
  default     = "4919-SUBNET"
}

variable "subnet_address_prefixes" {
  description = "Address ranges for the subnet."
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "nsg_name" {
  description = "Name of the network security group."
  type        = string
  default     = "4919-NSG"
}

variable "admin_source_cidr" {
  description = "Trusted public IP range allowed administrative access."
  type        = string
}

variable "log_analytics_workspace_name" {
  description = "Name of the Log Analytics workspace."
  type        = string
  default     = "4919-LAW"
}

variable "recovery_services_vault_name" {
  description = "Name of the Recovery Services vault."
  type        = string
  default     = "4919-RSV"
}

variable "storage_account_name" {
  description = "Name of the storage account for VM boot diagnostics."
  type        = string
  default     = "4919lucngoddydiag"
}
