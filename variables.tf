# Name of the Azure resource group that will contain all lab resources
variable "resource_group_name" {
  description = "Name of the resource group"
  default     = "terraform-security-lab"
}

# Azure region where all resources will be deployed
# Change this to deploy to a different region
variable "location" {
  description = "Azure region"
  default     = "East US"
}
