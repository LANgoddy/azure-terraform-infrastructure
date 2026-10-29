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
