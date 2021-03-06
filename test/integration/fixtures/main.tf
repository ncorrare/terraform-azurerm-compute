module "linuxservers" {
  source                       = "../../../"
  location                     = "${var.location}"
  vm_os_simple                 = "${var.vm_os_simple}"
  public_ip_address_allocation = "static"
  public_ip_dns                = ["${var.public_ip_dns}"]
  vnet_subnet_id               = "${module.network.vnet_subnets[0]}"
  ssh_key                      = "${var.ssh_key}"
  resource_group_name          = "${var.resource_group_name}"
}

module "network" {
  source              = "Azure/network/azurerm"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  allow_ssh_traffic   = true
}
