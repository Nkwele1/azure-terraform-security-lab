# Display the resource group name after deployment
output "resource_group_name" {
  value = azurerm_resource_group.lab.name
}

# Display the virtual network address space after deployment
output "vnet_address_space" {
  value = azurerm_virtual_network.lab_vnet.address_space
}

# Display the NSG name after deployment
output "nsg_name" {
  value = azurerm_network_security_group.lab_nsg.name
}
