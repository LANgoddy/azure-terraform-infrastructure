resource "azurerm_public_ip" "this" {
  name                = "${var.load_balancer_name}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = var.tags
}

resource "azurerm_lb" "this" {
  name                = var.load_balancer_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "public-frontend"
    public_ip_address_id = azurerm_public_ip.this.id
  }

  tags = var.tags
}

resource "azurerm_lb_backend_address_pool" "this" {
  name            = "${var.load_balancer_name}-backend"
  loadbalancer_id = azurerm_lb.this.id
}

resource "azurerm_network_interface_backend_address_pool_association" "this" {
  for_each = var.network_interface_ids

  network_interface_id    = each.value
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.this.id
}

resource "azurerm_lb_probe" "this" {
  name            = "${var.load_balancer_name}-probe"
  loadbalancer_id = azurerm_lb.this.id
  protocol        = "Tcp"
  port            = 80
}

resource "azurerm_lb_rule" "this" {
  name                           = "${var.load_balancer_name}-http"
  loadbalancer_id                = azurerm_lb.this.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "public-frontend"

  backend_address_pool_ids = [
    azurerm_lb_backend_address_pool.this.id
  ]

  probe_id = azurerm_lb_probe.this.id
}
