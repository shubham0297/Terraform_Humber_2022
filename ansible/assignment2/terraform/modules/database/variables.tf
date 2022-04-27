
variable "resource_group_name" {
  description = "This variable will store the name of the Resource Group (passed from the root module, comes from rgroup module)"
}

variable "location" {
  description = "This variable will store the location where the Resource Group will be created (passed from the root module, comes from rgroup module)"
}

variable "resource_tags" {
  description = "This variable will store the value of tags which will be assigned to the all the resources in this module (passed from the root module)"
}

variable "name" {
  description = "This variable will store the name which will be used for server and database (passed from the root module)"
}

variable "server_sku_name" {
  description = "This variable will store the SKU of the PostgreSQL Server (passed from the root module)"
}

variable "server_properties" {
  type        = map(string)
  description = "This variable stores the value of the PostgreSQL Server"
  default = {
    version                 = 11
    ssl_enforcement_enabled = "true"
  }
}

variable "db_properties" {
  type        = map(string)
  description = "This variable stores the value of the PostgreSQL Database"
  default = {
    charset   = "UTF8"
    collation = "English_United States.1252"
  }
}

variable "administrator_logon_details" {
  default = {
    username = "psqladmin"
    password = "Assignment1@Automation!"
  }
}