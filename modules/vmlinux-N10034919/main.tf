resource "azurerm_public_ip" "this" {
  for_each = var.linux_vms

  name                = "${each.key}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = [each.value.zone]
  domain_name_label   = each.value.dns_label
  tags                = var.tags
}

resource "azurerm_network_interface" "this" {
  for_each = var.linux_vms

  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.this[each.key].id
  }
}

resource "azurerm_linux_virtual_machine" "this" {
  for_each = var.linux_vms

  name                = each.key
  computer_name       = each.key
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = coalesce(each.value.vm_size, var.vm_size)
  zone                = each.value.zone
  admin_username      = var.admin_username

  disable_password_authentication = true

  network_interface_ids = [
    azurerm_network_interface.this[each.key].id
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.admin_ssh_public_key
  }

  os_disk {
    name                 = "${each.key}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = coalesce(each.value.image_publisher, var.image_publisher)
    offer     = coalesce(each.value.image_offer, var.image_offer)
    sku       = coalesce(each.value.image_sku, var.image_sku)
    version   = coalesce(each.value.image_version, var.image_version)
  }

  boot_diagnostics {
    storage_account_uri = var.boot_diagnostics_storage_uri
  }

  tags = var.tags
}

resource "azurerm_virtual_machine_extension" "network_watcher" {
  for_each = var.linux_vms

  name                       = "${each.key}-network-watcher"
  virtual_machine_id         = azurerm_linux_virtual_machine.this[each.key].id
  publisher                  = "Microsoft.Azure.NetworkWatcher"
  type                       = "NetworkWatcherAgentLinux"
  type_handler_version       = "1.0"
  auto_upgrade_minor_version = true

  tags = var.tags
}

resource "azurerm_virtual_machine_extension" "azure_monitor" {
  for_each = var.linux_vms

  name                       = "${each.key}-azure-monitor"
  virtual_machine_id         = azurerm_linux_virtual_machine.this[each.key].id
  publisher                  = "Microsoft.Azure.Monitor"
  type                       = "AzureMonitorLinuxAgent"
  type_handler_version       = "1.0"
  auto_upgrade_minor_version = true

  tags = var.tags
}
