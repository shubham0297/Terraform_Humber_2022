terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate4572RG"
    storage_account_name = "tfstate4572sa"
    container_name       = "tfstate4572container"
    key                  = "assignment.terraform.tfstate"
  }
}