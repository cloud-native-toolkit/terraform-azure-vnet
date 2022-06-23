
locals {
  prefix_name       = var.name_prefix != "" && var.name_prefix != null ? var.name_prefix : var.resource_group_name
  vpc_name          = lower(replace(var.name != "" ? var.name : "${local.prefix_name}-vnet", "_", "-"))
  vnet              = data.azurerm_virtual_network.vnet
  vpc_id            = lookup(local.vnet, "id", "")
  guid              = lookup(local.vnet, "guid", "")
  acl_id            = ""
  security_group_name = "${local.vpc_name}-sg-default"
}

resource azurerm_virtual_network vnet {
  count = var.provision ? 1 : 0

  name                = local.vpc_name
  resource_group_name = var.resource_group_name
  location            = var.region
  address_space       = var.address_prefixes
}

data azurerm_virtual_network vnet {
  depends_on = [azurerm_virtual_network.vnet]

  name                = local.vpc_name
  resource_group_name = var.resource_group_name
}

resource azurerm_network_security_group default {
  count = var.provision ? 1 : 0

  name                = local.security_group_name
  location            = var.region
  resource_group_name = var.resource_group_name

  tags = {
    default = "true"
  }
}

data azurerm_network_security_group default {
  depends_on = [azurerm_network_security_group.default]

  name                = local.security_group_name
  resource_group_name = var.resource_group_name
}
