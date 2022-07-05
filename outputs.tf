
output "name" {
  value       = local.vpc_name
  depends_on  = [azurerm_virtual_network.vnet]
  description = "The name of the VNet instance"
}

output "id" {
  value       = local.vpc_id
  depends_on  = [azurerm_virtual_network.vnet]
  description = "The id of the VNet instance"
}

output "crn" {
  value       = local.guid
  depends_on  = [azurerm_virtual_network.vnet]
  description = "The CRN for the VNet instance"
}

output "count" {
  value       = 1
  description = "The number of VPCs created by this module. Always set to 1"
}

output "names" {
  value       = [local.vpc_name]
  depends_on  = [azurerm_virtual_network.vnet]
  description = "The name of the vpc instance"
}

output "ids" {
  value       = [local.vpc_id]
  depends_on  = [azurerm_virtual_network.vnet]
  description = "The id of the vnet instance"
}

output "addresses" {
  value = lookup(local.vnet, "address_space", [])
  description = "The ip address ranges for the VNet"
}
