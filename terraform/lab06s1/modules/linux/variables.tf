## VARIABLES FOR LINUX MODULE

## LOCALS
locals {
  lab03_tags = {
    Name         = "Terraform-Class"
    Project      = "Learning"
    ContactEmail = "n01354572@humber.ca"
    Environment  = "Lab"
  }
}

## VARIABLE FOR AVAILABILITY SET
variable "linux_avs" {
  # default = "linux_avs"
}

variable "resource_group" {
  description = "This is the resource group where all the resources will be deployed"
}

variable "location" {
  description = "This is the location where all the infrastructure will be deployed"
}

## VARIABLE FOR COUNT
variable "count_val" {
  description = "This is the count metadata which will be used while creating resources"
}

## VARIABLES FOR VIRTUAL MACHINE RESOURCES 
variable "vm" {
  type = map(string)

  # default = {
  #   # name = "lab04s2-db1-u-vm1"
  #   # size = "Standard_B1s"
  # }

  description = "This variable defines all the properties of the virtual machine"
}

variable "os_info" {
  type = map(string)

  default = {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "19.04"
    version   = "latest"
  }

  description = "This variable defines the attributes of the OS which we will use in our VM"
}

variable "os_disk" {
  type = map(string)

  default = {
    account_type = "Premium_LRS"
    disk_size    = "32"
    caching      = "ReadWrite"
  }

  description = "This variable defines all the attribute of the OS disk"
}

variable "admin_user" {
  default = "n01354572"
}

variable "public_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "private_key" {
  default = "~/.ssh/id_rsa"
}

variable "subnet_id" {

}

variable "subnet_association" {

}