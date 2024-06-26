#This is an Azure Montreal College Tutorial for Storage Account creation--->Storage Container name Creation--->Storage Blob Creation
locals{
   cluster_list=["montreal","toronto","vancouver","alberta"]
}
resource "azurerm_kubernetes_cluster" "georgeibrahimcluster" {
  name                = "georgeibrahimcluster"
  location            = azurerm_resource_group.azureresourcegroup.location
  resource_group_name = azurerm_resource_group.azureresourcegroup.name
  dns_prefix          = "george"

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
resource "azurerm_kubernetes_cluster" "george" {
  for_each            = {for cluster in local.cluster_list: cluster=>cluster}
  name                = "${var.prefix}cluster"
  location            = azurerm_resource_group.azureresourcegroup.location
  resource_group_name = azurerm_resource_group.azureresourcegroup.name
  dns_prefix          = "george"

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
variable "prefix"{
 type=string
 default="george"
}
output "kube_name"{
  value=[for cluster in azurerm_kubernetes_cluster.george:cluster.name ]
}
variable "identity"{
 type=string
 default="SystemAssigned"
}
output "identity" {
  value = var.identity
}
variable "tags"{
 type=string
 default= "Production"
}
output "tags" {
  value = var.tags
}
resource "azurerm_kubernetes_cluster_node_pool" "kube1nodepool" {
for_each               = azurerm_kubernetes_cluster.george
name                   = "${each.key}"
kubernetes_cluster_id  = each.value.id
vm_size                = "Standard_DS2_v2"
node_count             = 1 
  tags = {
    Environment = "Production"
  }
}
output "id" {
  value = [
    for cluster in azurerm_kubernetes_cluster.george: cluster.id
  ]
}
 
output "kube_config" {
  sensitive = true
  value = [ 
    for cluster in azurerm_kubernetes_cluster.george: cluster.kube_config_raw
  ]
}
 
output "client_key" {
  sensitive = true
  value = [
    for cluster in azurerm_kubernetes_cluster.george: cluster.kube_config.0.client_key
  ]
}
 
output "client_certificate" {
  sensitive = true
  value = [
    for cluster in azurerm_kubernetes_cluster.george: cluster.kube_config.0.client_certificate
  ]
}
 
output "cluster_ca_certificate" {
  sensitive = true
  value = [
    for cluster in azurerm_kubernetes_cluster.george: cluster.kube_config.0.cluster_ca_certificate
  ]
}
 
output "host" {
  sensitive = true
  value = [
    for cluster in azurerm_kubernetes_cluster.george: cluster.kube_config.0.host
  ]
}
