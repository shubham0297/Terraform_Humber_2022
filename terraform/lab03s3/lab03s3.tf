## Resource block to create Linux Virtual machine
resource "azurerm_linux_virtual_machine" "linux_vm" {
  name                  = "${var.vm.name}-vm"
  resource_group_name   = var.rg
  location              = var.location
  size                  = var.vm.size
  admin_username        = var.admin_user
  network_interface_ids = [azurerm_network_interface.network_interface.id]
  tags                  = local.lab03_tags

  admin_ssh_key {
    username   = var.admin_user
    public_key = file(var.public_key)
  }

  os_disk {
    name                 = "${var.vm.name}-osdisk"
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
}


## Resource block for network interface
resource "azurerm_network_interface" "network_interface" {
  name                = "${var.vm.name}-nic"
  location            = var.location
  resource_group_name = var.rg
  tags                = local.lab03_tags

  ip_configuration {
    name                          = "${var.vm.name}-ip"
    subnet_id                     = azurerm_subnet.subnet.id
    public_ip_address_id          = azurerm_public_ip.public_ip.id
    private_ip_address_allocation = "Dynamic"
  }
}

## Resource block for public ip address 
resource "azurerm_public_ip" "public_ip" {
  name                = "${var.vm.name}-pip"
  resource_group_name = var.rg
  location            = var.location
  allocation_method   = "Dynamic"
  depends_on          = [azurerm_resource_group.rg]
  tags                = local.lab03_tags
}