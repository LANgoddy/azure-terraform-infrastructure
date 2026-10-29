output "resource_group_name" {
  description = "Name of the project resource group."
  value       = module.rgroup.resource_group_name
}

output "vnet_name" {
  description = "Name of the project virtual network."
  value       = module.network.vnet_name
}

output "subnet_name" {
  description = "Name of the project subnet."
  value       = module.network.subnet_name
}

output "log_analytics_workspace_name" {
  description = "Name of the Log Analytics workspace."
  value       = module.common.log_analytics_workspace_name
}

output "recovery_services_vault_name" {
  description = "Name of the Recovery Services vault."
  value       = module.common.recovery_services_vault_name
}

output "storage_account_name" {
  description = "Name of the boot diagnostics storage account."
  value       = module.common.storage_account_name
}

output "linux_hostnames" {
  description = "Linux VM hostnames."
  value       = module.vmlinux.hostnames
}

output "linux_fqdns" {
  description = "Linux VM fully qualified domain names."
  value       = module.vmlinux.fqdns
}

output "linux_private_ip_addresses" {
  description = "Linux VM private IP addresses."
  value       = module.vmlinux.private_ip_addresses
}

output "linux_public_ip_addresses" {
  description = "Linux VM public IP addresses."
  value       = module.vmlinux.public_ip_addresses
}
