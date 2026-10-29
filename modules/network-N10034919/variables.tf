variable "resource_group_name" {
  description = "Resource group containing the network."
  type        = string
}

variable "location" {
  description = "Azure region for the network."
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network."
  type        = string
}

variable "vnet_address_space" {
  description = "Address ranges for the virtual network."
  type        = list(string)
}

variable "subnet_name" {
  description = "Name of the subnet."
  type        = string
}

variable "subnet_address_prefixes" {
  description = "Address ranges for the subnet."
  type        = list(string)
}

variable "nsg_name" {
  description = "Name of the network security group."
  type        = string
}

variable "admin_source_cidr" {
  description = "Trusted public IP range allowed to access SSH, RDP, and WinRM."
  type        = string
}

variable "tags" {
  description = "Common resource tags supplied by the root module."
  type        = map(string)
}
