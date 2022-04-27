## Resource block to create Linux Availability Set
resource "azurerm_availability_set" "linux_avs" {
  name                         = var.linux_avs
  location                     = var.location
  resource_group_name          = var.resource_group
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  tags                         = local.lab03_tags
}


## Resource block to create Linux Virtual machine
resource "azurerm_linux_virtual_machine" "linux_vm" {
  count                 = var.count_val
  name                  = "${var.vm.name}-vm-${format("%1d", count.index + 1)}"
  resource_group_name   = var.resource_group
  location              = var.location
  size                  = var.vm.size
  admin_username        = var.admin_user
  network_interface_ids = [element(azurerm_network_interface.network_interface[*].id, count.index + 1)]
  tags                  = local.lab03_tags
  depends_on            = [var.resource_group]

  admin_ssh_key {
    username   = var.admin_user
    public_key = file(var.public_key)
  }

  os_disk {
    name                 = "${var.vm.name}-osdisk-${format("%1d", count.index + 1)}"
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
  count               = var.count_val
  name                = "${var.vm.name}-nic-${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.resource_group
  tags                = local.lab03_tags
  depends_on = [var.subnet_association
  ]


  ip_configuration {
    name                          = "${var.vm.name}-ip-${format("%1d", count.index + 1)}"
    subnet_id                     = var.subnet_id
    public_ip_address_id          = element(azurerm_public_ip.public_ip[*].id, count.index + 1)
    private_ip_address_allocation = "Dynamic"
  }
}

## Resource block for public ip address 
resource "azurerm_public_ip" "public_ip" {
  count               = var.count_val
  name                = "${var.vm.name}-pip-${format("%1d", count.index + 1)}"
  resource_group_name = var.resource_group
  location            = var.location
  allocation_method   = "Dynamic"
  depends_on          = [var.resource_group]
  domain_name_label   = "${var.vm.name}-dns-${format("%1d", count.index + 1)}"
  tags                = local.lab03_tags

}