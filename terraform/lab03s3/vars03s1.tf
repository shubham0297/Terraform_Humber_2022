## VARIABLES FOR LAB-03

variable "rg" {
  default     = "lab03-rg"
  description = "This resource group is to hosts all the infrastructure"
}

variable "location" {
  default     = "Canada East"
  description = "This is the location where a resource will be provisioned"
}

variable "vnet" {
  default     = "lab03-vnet"
  description = "This is to manage a virtual network including any configured subnets. "
}

variable "vnet_addr_space" {
  default     = ["10.0.0.0/16"]
  description = "This is the address range for the virtual network (vnet)"
}

variable "subnet_1" {
  default     = "lab03-subnet1"
  description = "This is the name of the first subnet "
}

variable "subnet_2" {
  default     = "lab03-subnet2"
  description = "This is the name of the second subnet "
}

variable "sub1_addr_space" {
  default     = ["10.0.1.0/24"]
  type        = list(string)
  description = "This defines the address space of the first subnet"
}

variable "sub2_addr_space" {
  default     = ["10.0.2.0/24"]
  type        = list(string)
  description = "This defines the address space of the second subnet"
}

variable "nsg_1" {
  default     = "lab03-nsg1"
  description = "This is the name for first network security group"
}

variable "nsg_2" {
  default     = "lab03-nsg2"
  description = "This is the name for second network security group"
}