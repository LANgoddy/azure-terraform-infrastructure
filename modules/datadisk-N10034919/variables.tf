variable "resource_group_name" {
  description = "Resource group containing the data disks."
  type        = string
}

variable "location" {
  description = "Azure region for the data disks."
  type        = string
}

variable "vm_disks" {
  description = "VM names mapped to their IDs and availability zones."
  type = map(object({
    vm_id = string
    zone  = string
  }))
}

variable "disk_size_gb" {
  description = "Size of each data disk in GB."
  type        = number
  default     = 10
}

variable "storage_account_type" {
  description = "Storage SKU for the managed data disks."
  type        = string
  default     = "Standard_LRS"
}

variable "tags" {
  description = "Common resource tags supplied by the root module."
  type        = map(string)
}
