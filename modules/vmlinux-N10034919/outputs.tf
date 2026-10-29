output "hostnames" {
  description = "Linux VM hostnames."
  value = {
    for name, vm in azurerm_linux_virtual_machine.this :
    name => vm.computer_name
  }
}

output "fqdns" {
  description = "Linux VM fully qualified domain names."
  value = {
    for name, ip in azurerm_public_ip.this :
    name => ip.fqdn
  }
}

output "private_ip_addresses" {
  description = "Linux VM private IP addresses."
  value = {
    for name, nic in azurerm_network_interface.this :
    name => nic.private_ip_address
  }
}

output "public_ip_addresses" {
  description = "Linux VM public IP addresses."
  value = {
    for name, ip in azurerm_public_ip.this :
    name => ip.ip_address
  }
}

output "vm_ids" {
  description = "Linux VM IDs for attaching data disks."
  value = {
    for name, vm in azurerm_linux_virtual_machine.this :
    name => vm.id
  }
}

output "network_interface_ids" {
  description = "Linux network interface IDs for load balancer associations."
  value = {
    for name, nic in azurerm_network_interface.this :
    name => nic.id
  }
}
