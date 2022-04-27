## VARIABLES FOR RESOURCE GROUP MODULE

variable "linux_rg" {
  description = "This resource group is for Linux Resource to hosts all the infrastructure related to Linux"
}


variable "windows_rg" {
  description = "This resource group is for Windows Resource to hosts all the infrastructure related to Windows"
}

variable "network_rg" {
  description = "This resource group is for Network Resource to hosts all the infrastructure related to Networks"
}

variable "location" {
  description = "This is the location where the resources will be provisioned"
}