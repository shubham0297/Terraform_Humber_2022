terraform {
  backend "azurerm" {
    resource_group_name  = "tfstateRG_Lab_08"
    storage_account_name = "tfstate4572sa"
    container_name       = "tfstate4572container"
    key                  = "lab8.terraform.tfstate"
  }
}