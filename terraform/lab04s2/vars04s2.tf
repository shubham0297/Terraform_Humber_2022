## LOCALS
locals {
  lab03_tags = {
    Name         = "Terraform-Class"
    Project      = "Learning"
    ContactEmail = "n01354572@humber.ca"
    Environment  = "Lab"
  }
}
## VARIABLE FOR WINDOWS AVAILABILITY SET
variable "windows_avs" {
  default = "windows_avs"
}


## VARIABLES FOR VIRTUAL MACHINE RESOURCES 
variable "windows_name" {
  type = map(string)
  default = {
    lab-web-w-vm1 = "Standard_B1s"
    lab-web-w-vm2 = "Standard_B1ms"
  }
  description = "This variable defines all the properties of the virtual machine"
}

variable "os_info" {
  type = map(string)

  default = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  description = "This variable defines the attributes of the OS which we will use in our VM"
}

variable "os_disk" {
  type = map(string)

  default = {
    account_type = "StandardSSD_LRS"
    disk_size    = "127"
    caching      = "ReadWrite"
  }

  description = "This variable defines all the attribute of the OS disk"
}

variable "admin_user" {
  type = map(string)

  default = {
    username = "n01354572"
    password = "Lab4@Automation"
  }

  sensitive = true
}
