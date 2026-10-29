resource "azurerm_managed_disk" "this" {
  for_each = var.vm_disks

  name                 = "${each.key}-datadisk"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb
  zone                 = each.value.zone

  tags = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "this" {
  for_each = var.vm_disks

  managed_disk_id    = azurerm_managed_disk.this[each.key].id
  virtual_machine_id = each.value.vm_id
  lun                = 0
  caching            = "ReadWrite"
}
