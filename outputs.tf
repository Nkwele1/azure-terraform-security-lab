output "resource_group_name" {
  value = azurerm_resource_group.lab.name
}

output "vnet_address_space" {
  value = azurerm_virtual_network.lab_vnet.address_space
}

output "nsg_name" {
  value = azurerm_network_security_group.lab_nsg.name
}