variable "resource_group_name" {
  description = "Resource group containing the Windows VMs."
  type        = string
}

variable "location" {
  description = "Azure region for the Windows VMs."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the Windows VM network interfaces."
  type        = string
}

variable "tags" {
  description = "Common resource tags supplied by the root module."
  type        = map(string)
}

variable "boot_diagnostics_storage_uri" {
  description = "Blob endpoint of the common services storage account."
  type        = string
}

variable "vm_count" {
  description = "Number of Windows VMs to create."
  type        = number
  default     = 1

  validation {
    condition     = var.vm_count >= 1 && floor(var.vm_count) == var.vm_count
    error_message = "vm_count must be a positive whole number."
  }
}

variable "vm_name_prefix" {
  description = "Prefix for Windows VM names."
  type        = string
}

variable "dns_label_prefix" {
  description = "Prefix for Windows VM public DNS labels."
  type        = string
}

variable "availability_set_name" {
  description = "Name of the Windows availability set."
  type        = string
}

variable "vm_size" {
  description = "Azure VM size for the Windows VMs."
  type        = string
}

variable "admin_username" {
  description = "Administrator username for the Windows VMs."
  type        = string
}

variable "admin_password" {
  description = "Administrator password for the Windows VMs."
  type        = string
  sensitive   = true
}

variable "image_publisher" {
  description = "Publisher of the Windows VM image."
  type        = string
  default     = "MicrosoftWindowsServer"
}

variable "image_offer" {
  description = "Offer containing the Windows VM image."
  type        = string
  default     = "WindowsServer"
}

variable "image_sku" {
  description = "SKU of the Windows Server 2022 image."
  type        = string
  default     = "2022-datacenter-g2"
}

variable "image_version" {
  description = "Version of the Windows VM image."
  type        = string
  default     = "latest"
}
