# Configure Terraform and required providers
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

# Authenticate to Azure using Azure CLI credentials
provider "azurerm" {
  features {}
}

# Create a resource group to contain all lab resources
resource "azurerm_resource_group" "lab" {
  name     = var.resource_group_name
  location = var.location
}

# Deploy a virtual network with enterprise address space
resource "azurerm_virtual_network" "lab_vnet" {
  name                = "lab-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.lab.location
  resource_group_name = azurerm_resource_group.lab.name
}

# Create a subnet within the virtual network
resource "azurerm_subnet" "lab_subnet" {
  name                 = "lab-subnet"
  resource_group_name  = azurerm_resource_group.lab.name
  virtual_network_name = azurerm_virtual_network.lab_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create a Network Security Group with deny-by-default inbound rules
# This enforces zero trust principles at the network layer
resource "azurerm_network_security_group" "lab_nsg" {
  name                = "lab-nsg"
  location            = azurerm_resource_group.lab.location
  resource_group_name = azurerm_resource_group.lab.name

  # Block all inbound traffic unless explicitly permitted
  security_rule {
    name                       = "deny-all-inbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Associate the NSG with the subnet to enforce security rules
resource "azurerm_subnet_network_security_group_association" "lab_nsg_assoc" {
  subnet_id                 = azurerm_subnet.lab_subnet.id
  network_security_group_id = azurerm_network_security_group.lab_nsg.id
}
