
output "name" {
  value       = local.vpc_name
  depends_on  = [azurerm_virtual_network.vnet]
  description = "The name of the vpc instance"
}

output "id" {
  value       = local.vpc_id
  depends_on  = [azurerm_virtual_network.vnet]
  description = "The id of the vpc instance"
}

output "acl_id" {
  value       = local.acl_id
  description = "The id of the network acl"
}

output "crn" {
  value       = local.guid
  depends_on  = [azurerm_virtual_network.vnet]
  description = "The CRN for the vpc instance"
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
  description = "The id of the vpc instance"
}

output "base_security_group" {
  value       = var.enabled ? data.azurerm_network_security_group.default[0].id : ""
  description = "The id of the base security group to be shared by other resources. The base group is different from the default security group."
}

output "addresses" {
  value = lookup(local.vnet, "address_space", [])
  description = "The ip address ranges for the VPC"
}

output "enabled" {
  value = var.enabled
  description = "Flag indicating that the module will provision resources"
}
