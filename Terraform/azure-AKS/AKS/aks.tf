resource "azurerm_kubernetes_cluster" "dom_aks" {
  name                    = var.aks_name
  location                = var.location
  resource_group_name     = var.rg
  private_cluster_enabled = var.is_private_cluster
  dns_prefix              = var.dns_name
  sku_tier                = var.sku

  default_node_pool {
    name           = var.node_name
    node_count     = var.node_count_number
    vm_size        = var.node_image_size
    os_sku         = var.node_os
    vnet_subnet_id = var.subnet_id
  }

  identity {
    type = var.user_account
  }

  tags = {
    Environment = "Development"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.dom_aks.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.dom_aks.kube_config_raw
  sensitive = true
}
