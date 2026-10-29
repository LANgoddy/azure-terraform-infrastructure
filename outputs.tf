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
