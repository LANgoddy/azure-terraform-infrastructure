output "load_balancer_name" {
  description = "Name of the load balancer."
  value       = azurerm_lb.this.name
}

output "public_ip_address" {
  description = "Public IP address of the load balancer."
  value       = azurerm_public_ip.this.ip_address
}

output "backend_pool_id" {
  description = "ID of the Linux VM backend pool."
  value       = azurerm_lb_backend_address_pool.this.id
}
