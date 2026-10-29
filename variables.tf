variable "resource_group_name" {
  description = "Name of the project resource group."
  type        = string
  default     = "4919-RG"
}

variable "location" {
  description = "Azure region for the project infrastructure."
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network."
  type        = string
  default     = "4919-VNET"
}

variable "vnet_address_space" {
  description = "Address ranges for the virtual network."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "Name of the subnet."
  type        = string
  default     = "4919-SUBNET"
}

variable "subnet_address_prefixes" {
  description = "Address ranges for the subnet."
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "nsg_name" {
  description = "Name of the network security group."
  type        = string
  default     = "4919-NSG"
}

variable "admin_source_cidr" {
  description = "Trusted public IP range allowed administrative access."
  type        = string
}

variable "log_analytics_workspace_name" {
  description = "Name of the Log Analytics workspace."
  type        = string
  default     = "4919-LAW"
}

variable "recovery_services_vault_name" {
  description = "Name of the Recovery Services vault."
  type        = string
  default     = "4919-RSV"
}

variable "storage_account_name" {
  description = "Name of the storage account for VM boot diagnostics."
  type        = string
  default     = "4919lucngoddydiag"
}

variable "linux_vms" {
  description = "Linux VM names, availability zones, and DNS labels."

  type = map(object({
    zone      = string
    dns_label = string
  }))

  default = {
    "4919-linux-1" = {
      zone      = "1"
      dns_label = "4919-lngoddy-linux-1"
    }
    "4919-linux-2" = {
      zone      = "2"
      dns_label = "4919-lngoddy-linux-2"
    }
    "4919-linux-3" = {
      zone      = "3"
      dns_label = "4919-lngoddy-linux-3"
    }
  }
}

variable "linux_vm_size" {
  description = "Azure VM size for the Linux VMs."
  type        = string
}

variable "linux_admin_username" {
  description = "Administrator username for the Linux VMs."
  type        = string
  default     = "azureadmin"
}

variable "ssh_public_key_path" {
  description = "Local path to the SSH public key."
  type        = string
}

variable "ssh_private_key_path" {
  description = "Local path to the SSH private key for the hostname provisioner."
  type        = string
}
