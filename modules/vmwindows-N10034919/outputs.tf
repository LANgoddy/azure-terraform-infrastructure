output "hostnames" {
  description = "Windows VM hostnames."
  value       = azurerm_windows_virtual_machine.this[*].computer_name
}

output "fqdns" {
  description = "Windows VM fully qualified domain names."
  value       = azurerm_public_ip.this[*].fqdn
}

output "private_ip_addresses" {
  description = "Windows VM private IP addresses."
  value       = azurerm_network_interface.this[*].private_ip_address
}

output "public_ip_addresses" {
  description = "Windows VM public IP addresses."
  value       = azurerm_public_ip.this[*].ip_address
}

output "vm_ids" {
  description = "Windows VM IDs for attaching data disks."
  value       = azurerm_windows_virtual_machine.this[*].id
}

output "availability_set_name" {
  description = "Name of the Windows availability set."
  value       = azurerm_availability_set.this.name
}
