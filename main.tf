locals {
  common_tags = {
    Project        = "CCGC 5502 Terraform Project"
    Name           = "lucia.ngoddy"
    ExpirationDate = "2027-12-31"
    Environment    = "Learning"
  }
}

module "rgroup" {
  source = "./modules/rgroup-N10034919"

  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = local.common_tags
}

module "network" {
  source = "./modules/network-N10034919"

  resource_group_name     = module.rgroup.resource_group_name
  location                = module.rgroup.location
  vnet_name               = var.vnet_name
  vnet_address_space      = var.vnet_address_space
  subnet_name             = var.subnet_name
  subnet_address_prefixes = var.subnet_address_prefixes
  nsg_name                = var.nsg_name
  admin_source_cidr       = var.admin_source_cidr
  tags                    = local.common_tags
}

module "common" {
  source = "./modules/common-N10034919"

  resource_group_name          = module.rgroup.resource_group_name
  location                     = module.rgroup.location
  log_analytics_workspace_name = var.log_analytics_workspace_name
  recovery_services_vault_name = var.recovery_services_vault_name
  storage_account_name         = var.storage_account_name
  tags                         = local.common_tags
}

module "vmlinux" {
  source = "./modules/vmlinux-N10034919"

  resource_group_name = module.rgroup.resource_group_name
  location            = module.rgroup.location
  subnet_id           = module.network.subnet_id

  linux_vms      = var.linux_vms
  vm_size        = var.linux_vm_size
  admin_username = var.linux_admin_username

  admin_ssh_public_key = file(pathexpand(var.ssh_public_key_path))
  ssh_private_key_path = var.ssh_private_key_path

  boot_diagnostics_storage_uri = module.common.storage_account_primary_blob_endpoint
  tags                         = local.common_tags

  depends_on = [module.network]
}

module "vmwindows" {
  source = "./modules/vmwindows-N10034919"

  resource_group_name = module.rgroup.resource_group_name
  location            = module.rgroup.location
  subnet_id           = module.network.subnet_id

  vm_count              = var.windows_vm_count
  vm_name_prefix        = var.windows_vm_name_prefix
  dns_label_prefix      = var.windows_dns_label_prefix
  availability_set_name = var.windows_availability_set_name
  vm_size               = var.windows_vm_size
  admin_username        = var.windows_admin_username
  admin_password        = var.windows_admin_password

  boot_diagnostics_storage_uri = module.common.storage_account_primary_blob_endpoint
  tags                         = local.common_tags

  depends_on = [module.network]
}
