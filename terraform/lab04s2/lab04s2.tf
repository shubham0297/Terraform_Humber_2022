## Resource block to create Availability Set
resource "azurerm_availability_set" "windows_avs" {
  name                         = var.windows_avs
  location                     = var.location
  resource_group_name          = azurerm_resource_group.rg.name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  tags                         = local.lab03_tags

}


## Resource block to create Windows Virtual machine
resource "azurerm_windows_virtual_machine" "windows_vm" {
  for_each              = var.windows_name
  name                  = each.key
  resource_group_name   = var.rg
  location              = var.location
  size                  = each.value
  admin_username        = var.admin_user.username
  admin_password        = var.admin_user.password
  network_interface_ids = [azurerm_network_interface.network_interface[each.key].id]
  tags                  = local.lab03_tags
  depends_on            = [azurerm_resource_group.rg]


  os_disk {
    name                 = "${each.key}-osdisk"
    caching              = var.os_disk.caching
    storage_account_type = var.os_disk.account_type
    disk_size_gb         = var.os_disk.disk_size
  }

  source_image_reference {
    publisher = var.os_info.publisher
    offer     = var.os_info.offer
    sku       = var.os_info.sku
    version   = var.os_info.version
  }

  winrm_listener {
    protocol = "Http"
  }
}


## Resource block for network interface
resource "azurerm_network_interface" "network_interface" {
  for_each            = var.windows_name
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.rg
  tags                = local.lab03_tags


  ip_configuration {
    name                          = "${each.key}-ip"
    subnet_id                     = azurerm_subnet.subnet2.id
    public_ip_address_id          = azurerm_public_ip.public_ip[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

## Resource block for public ip address 
resource "azurerm_public_ip" "public_ip" {
  for_each            = var.windows_name
  name                = "${each.key}-pip"
  resource_group_name = var.rg
  location            = var.location
  allocation_method   = "Dynamic"
  depends_on          = [azurerm_resource_group.rg]
  tags                = local.lab03_tags
}