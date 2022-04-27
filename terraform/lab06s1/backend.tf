terraform {
  backend "azurerm" {
    resource_group_name  = "terraform_n0134572-RG"
    storage_account_name = "tfstaten01354572sa"
    container_name       = "tfstatefiles"
    key                  = "lab6.terraform.tfstate"
  }
}