output "disk_names" {
  description = "Data disk names mapped to their VM names."
  value = {
    for name, disk in azurerm_managed_disk.this :
    name => disk.name
  }
}

output "disk_ids" {
  description = "Data disk IDs mapped to their VM names."
  value = {
    for name, disk in azurerm_managed_disk.this :
    name => disk.id
  }
}
