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
