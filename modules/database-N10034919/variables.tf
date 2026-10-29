variable "resource_group_name" {
  description = "Resource group containing the PostgreSQL server."
  type        = string
}

variable "location" {
  description = "Azure region for the PostgreSQL server."
  type        = string
}

variable "server_name" {
  description = "Name of the PostgreSQL Flexible Server."
  type        = string
}

variable "tags" {
  description = "Common resource tags supplied by the root module."
  type        = map(string)
}

variable "admin_username" {
  description = "Administrator username for the PostgreSQL server."
  type        = string
}

variable "admin_password" {
  description = "Administrator password for the PostgreSQL server."
  type        = string
  sensitive   = true
}

variable "postgresql_version" {
  description = "PostgreSQL major version."
  type        = string
}

variable "sku_name" {
  description = "Compute SKU for the PostgreSQL Flexible Server."
  type        = string
}

variable "storage_mb" {
  description = "Allocated PostgreSQL storage in megabytes."
  type        = number
}
