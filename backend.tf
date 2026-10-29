terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten10034919RG"
    storage_account_name = "tfstaten10034919sa"
    container_name       = "tfstatefiles"
    key                  = "project-N10034919.tfstate"
  }
}
