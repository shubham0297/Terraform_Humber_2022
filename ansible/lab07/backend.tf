terraform {
  backend "azurerm" {
    resource_group_name  = "terraform_4572-RG-Lab7"
    storage_account_name = "tfstate4572salab7"
    container_name       = "tfstatefiles"
    key                  = "lab7.terraform.tfstate"
  }
}