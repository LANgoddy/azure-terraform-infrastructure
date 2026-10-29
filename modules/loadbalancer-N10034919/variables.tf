variable "resource_group_name" {
  description = "Resource group containing the load balancer."
  type        = string
}

variable "location" {
  description = "Azure region for the load balancer."
  type        = string
}

variable "load_balancer_name" {
  description = "Name of the public load balancer."
  type        = string
}

variable "network_interface_ids" {
  description = "Linux VM names mapped to their network interface IDs."
  type        = map(string)
}

variable "tags" {
  description = "Common resource tags supplied by the root module."
  type        = map(string)
}
