module "resource_group" {
  source        = "./modules/resource_group"
  rg_group_name = "lab08-RG"
  location      = "Canada East"
}

module "network" {
  source          = "./modules/network"
  resource_group  = module.resource_group.rg_group_name_out
  location        = "Canada East"
  vnet            = "lab05-Vnet"
  vnet_addr_space = ["10.0.0.0/16"]
  subnet_1        = "lab05-subnet1"
  subnet_2        = "lab05-subnet2"
  sub1_addr_space = ["10.0.1.0/24"]
  sub2_addr_space = ["10.0.2.0/24"]
  nsg_1           = "lab05-nsg1"
  nsg_2           = "lab05-nsg2"
}

module "linux" {
  source         = "./modules/linux"
  resource_group = module.resource_group.rg_group_name_out
  location       = "Canada East"
  linux_avs      = "Linux_AVS"
  count_val      = 2
  vm = {
    name = "ansible-c-4572-vm"
    size = "Standard_B1s"
  }
  subnet_id          = module.network.subnet_id
  subnet_association = module.network.subnet_association
}

module "windows" {
  source         = "./modules/windows"
  resource_group = module.resource_group.rg_group_name_out
  location       = "Canada East"
  windows_avs    = "Windows_AVS"
  windows_name = {
    ansible-w-4572 = "Standard_B1s"
    # lab-web-w-vm2 = "Standard_B1ms"       # As we can only deploy 4 VMs and we already have 2 linux Vms
  }
  subnet2_id           = module.network.subnet2_id
  subnet_2_association = module.network.subnet_2_association
}