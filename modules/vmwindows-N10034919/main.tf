resource "azurerm_availability_set" "this" {
  name                         = var.availability_set_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  managed                      = true

  tags = var.tags
}

resource "azurerm_public_ip" "this" {
  count = var.vm_count

  name                = "${var.vm_name_prefix}-${count.index + 1}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label   = "${var.dns_label_prefix}-${count.index + 1}"

  tags = var.tags
}

resource "azurerm_network_interface" "this" {
  count = var.vm_count

  name                = "${var.vm_name_prefix}-${count.index + 1}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.this[count.index].id
  }
}

resource "azurerm_windows_virtual_machine" "this" {
  count = var.vm_count

  name                = "${var.vm_name_prefix}-${count.index + 1}"
  computer_name       = "${var.vm_name_prefix}-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  availability_set_id = azurerm_availability_set.this.id

  network_interface_ids = [
    azurerm_network_interface.this[count.index].id
  ]

  os_disk {
    name                 = "${var.vm_name_prefix}-${count.index + 1}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  boot_diagnostics {
    storage_account_uri = var.boot_diagnostics_storage_uri
  }

  tags = var.tags
}

resource "azurerm_virtual_machine_extension" "antimalware" {
  count = var.vm_count

  name                       = "${var.vm_name_prefix}-${count.index + 1}-antimalware"
  virtual_machine_id         = azurerm_windows_virtual_machine.this[count.index].id
  publisher                  = "Microsoft.Azure.Security"
  type                       = "IaaSAntimalware"
  type_handler_version       = "1.3"
  auto_upgrade_minor_version = true

  settings = jsonencode({
    AntimalwareEnabled        = true
    RealtimeProtectionEnabled = true
  })

  tags = var.tags
}
