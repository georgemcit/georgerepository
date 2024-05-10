locals{
   cluster_list=["montreal","toronto","vancouver","alberta"]
}
resource "azurerm_kubernetes_cluster" "georgeibrahimcluster" {
  name                = "georgeibrahimcluster"
  location            = azurerm_resource_group.azureresourcegroup.location
  resource_group_name = azurerm_resource_group.azureresourcegroup.name
  dns_prefix          = "ccrf2301"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}
