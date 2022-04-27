## OUTPUTS FOR WINDOWS MODULE

output "vm_hostname" {
  value = values(azurerm_windows_virtual_machine.windows_vm)[*].computer_name
}

output "private_ip" {
  value = values(azurerm_windows_virtual_machine.windows_vm)[*].private_ip_address
}

output "public_ip" {
  value = values(azurerm_windows_virtual_machine.windows_vm)[*].public_ip_address
}