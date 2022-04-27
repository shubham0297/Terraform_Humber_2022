## OUTPUT FOR MAIN MODULE

output "resource_group" {
  value = module.resource_group.rg_group_name_out
}

output "vnet" {
  value = module.network.vnet_name
}

output "vnet_addr_space" {
  value = module.network.vnet_addr_space
}

output "subnet_1_name" {
  value = module.network.subnet_1_name
}

output "subnet_2_name" {
  value = module.network.subnet_2_name
}

output "subnet_1_addr_space" {
  value = module.network.subnet_1_addr_space
}

output "subnet_2_addr_space" {
  value = module.network.subnet_2_addr_space
}

output "linux_hostnames" {
  value = module.linux.vm_hostname
}

output "linux_private_ips" {
  value = module.linux.private_ip
}

output "linux_public_ips" {
  value = module.linux.public_ip
}

output "linux_dns_names" {
  value = module.linux.vm_dns_names
}


output "windows_hostnames" {
  value = module.windows.vm_hostname
}

output "windows_private_ips" {
  value = module.windows.private_ip
}

output "windows_public_ips" {
  value = module.windows.public_ip
}

output "windows_dns" {
  value = module.windows.windows_dns
}