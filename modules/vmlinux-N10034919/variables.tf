variable "resource_group_name" {
  description = "Resource group containing the Linux VMs."
  type        = string
}

variable "location" {
  description = "Azure region for the Linux VMs."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the Linux VM network interfaces."
  type        = string
}

variable "tags" {
  description = "Common resource tags supplied by the root module."
  type        = map(string)
}

variable "linux_vms" {
  description = "Linux VM names mapped to their availability zones and DNS labels."
  type = map(object({
    zone      = string
    dns_label = string
  }))
}

variable "vm_size" {
  description = "Azure VM size for the Linux VMs."
  type        = string
}

variable "admin_username" {
  description = "Administrator username for the Linux VMs."
  type        = string
}

variable "admin_ssh_public_key" {
  description = "SSH public key used to access the Linux VMs."
  type        = string
}

variable "boot_diagnostics_storage_uri" {
  description = "Blob endpoint of the common services storage account."
  type        = string
}

variable "image_publisher" {
  description = "Publisher of the Linux VM image."
  type        = string
  default     = "OpenLogic"
}

variable "image_offer" {
  description = "Offer containing the Linux VM image."
  type        = string
  default     = "CentOS"
}

variable "image_sku" {
  description = "SKU of the Linux VM image."
  type        = string
  default     = "8_2-gen2"
}

variable "image_version" {
  description = "Version of the Linux VM image."
  type        = string
  default     = "8.2.2020111801"
}

variable "ssh_private_key_path" {
  description = "Local path to the SSH private key used by the hostname provisioner."
  type        = string
}
