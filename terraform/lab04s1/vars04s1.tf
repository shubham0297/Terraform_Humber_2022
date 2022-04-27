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
  default = "linux_avs"
}

## VARIABLE FOR COUNT
variable "count_val" {
  default = 2
}

## VARIABLES FOR VIRTUAL MACHINE RESOURCES 
variable "vm" {
  type = map(string)

  default = {
    name = "lab04s2-db1-u-vm1"
    size = "Standard_B1s"
  }

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
