## VARIABLES FOR NETWORK MODULE

variable "resource_group" {
  description = "This is the resource group where all the resources will be deployed"
}

variable "location" {
  description = "This is the location where all the infrastructure will be deployed"
}

variable "vnet" {
  # default     = "lab05-vnet"
  description = "This is to manage a virtual network including any configured subnets. "
}

variable "vnet_addr_space" {
  description = "This is the address range for the virtual network (vnet)"
}

variable "subnet_1" {
  # default     = "lab05-subnet1"
  description = "This is the name of the first subnet "
}

variable "subnet_2" {
  # default     = "lab05-subnet2"
  description = "This is the name of the second subnet "
}

variable "sub1_addr_space" {
  type        = list(string)
  description = "This defines the address space of the first subnet"
}

variable "sub2_addr_space" {
  type        = list(string)
  description = "This defines the address space of the second subnet"
}

variable "nsg_1" {
  # default     = "lab05-nsg1"
  description = "This is the name for first network security group"
}

variable "nsg_2" {
  # default     = "lab05-nsg2"
  description = "This is the name for second network security group"
}