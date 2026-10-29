resource "null_resource" "hostname" {
  for_each = var.linux_vms

  triggers = {
    vm_id     = azurerm_linux_virtual_machine.this[each.key].id
    public_ip = azurerm_public_ip.this[each.key].ip_address
  }

  connection {
    type        = "ssh"
    user        = var.admin_username
    host        = azurerm_public_ip.this[each.key].ip_address
    private_key = file(pathexpand(var.ssh_private_key_path))
    timeout     = "10m"
  }

  provisioner "remote-exec" {
    inline = [
      "hostname"
    ]
  }
}
