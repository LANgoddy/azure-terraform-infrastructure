variable "resource_group_name" {
  description = "Name of the project resource group."
  type        = string
  default     = "4919-RG"
}

variable "location" {
  description = "Azure region for the project infrastructure."
  type        = string
}
