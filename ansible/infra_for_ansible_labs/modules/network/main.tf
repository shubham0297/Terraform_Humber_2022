# Create a virtual network within the resource group
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet
  resource_group_name = var.resource_group
  location            = var.location
  address_space       = var.vnet_addr_space
}

# Create a subnet1
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_1
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.sub1_addr_space
}

# Create a security group
resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_1
  location            = var.location
  resource_group_name = var.resource_group

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Create subnet asscoiation
resource "azurerm_subnet_network_security_group_association" "subnet_association" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
  # depends_on = [azurerm_network_interface.network_interface
  # ]
}

# Create a subnet2
resource "azurerm_subnet" "subnet2" {
  name                 = var.subnet_2
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.sub2_addr_space
}

# Create a security group
resource "azurerm_network_security_group" "nsg2" {
  name                = var.nsg_2
  location            = var.location
  resource_group_name = var.resource_group

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "rule2"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5985"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Create subnet2 asscoiation
resource "azurerm_subnet_network_security_group_association" "subnet_association2" {
  subnet_id                 = azurerm_subnet.subnet2.id
  network_security_group_id = azurerm_network_security_group.nsg2.id
}