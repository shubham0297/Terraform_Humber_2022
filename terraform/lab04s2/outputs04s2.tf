## THIS FILE DEFINES THE OUTPUT VALUES FOR THE RESOURCES

output "vm_hostname" {
  value = values(azurerm_windows_virtual_machine.windows_vm)[*].computer_name
}

output "private_ip" {
  value = values(azurerm_windows_virtual_machine.windows_vm)[*].private_ip_address
}

output "public_ip" {
  value = values(azurerm_windows_virtual_machine.windows_vm)[*].public_ip_address
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "vnet_addr_space" {
  value = azurerm_virtual_network.vnet.address_space
}

output "subnet_1_name" {
  value = azurerm_subnet.subnet.name
}

output "subnet_2_name" {
  value = azurerm_subnet.subnet2.name
}

output "subnet_1_addr_space" {
  value = azurerm_subnet.subnet.address_prefixes
}

output "subnet_2_addr_space" {
  value = azurerm_subnet.subnet2.address_prefixes
}

output "network_interfaces" {
  value = values(azurerm_network_interface.network_interface)[*].name
}

output "windows_availability_set" {
  value = azurerm_availability_set.windows_avs.name
}