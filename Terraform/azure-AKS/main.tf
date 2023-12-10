# Terraform file for AKS Cluster

## Resource Group
module "resource_group" {
  source   = "./RG"
  rg_name  = "aks-proving-rg"
  location = "UK South"
}

# module "resource_group" {
#   source   = "./RG"
#   rg_name  = "aks-nodepool-rg"
#   location = "UK South"
# }

module "vnet" {
  source        = "./VNET"
  rg            = module.resource_group.rg_name_output
  vnet_name     = "my-virtual-network"
  vnet_location = module.resource_group.rg_location_output
  vnet_range    = ["10.1.0.0/16"]

  subnet_name  = "aks-subnet"
  subnet_range = ["10.1.0.0/22"]

}

module "aks" {
  source   = "./AKS"
  aks_name = "dom-proving-aks"
  rg       = module.resource_group.rg_name_output
  location = module.resource_group.rg_location_output

  dns_name           = "myaksnetwork"
  is_private_cluster = true
  sku                = "Free"

  ## node values
  node_name         = "system"
  node_count_number = 1
  node_image_size   = "standard_B4ms"
  node_os           = "Ubuntu"
  subnet_id         = module.vnet.subnet_id_output

  ## idenity
  user_account = "SystemAssigned"

  depends_on = [ module.vnet ]

}

output "rg_module_name" {
  value = module.resource_group.rg_name_output
}

output "rg_module_location" {
  value = module.resource_group.rg_location_output
}

output "vnet_subnet_id_output" {
  value = module.vnet.subnet_id_output
}