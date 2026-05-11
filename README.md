# Azure Terraform Security Lab

## Overview
This project deploys a secure Azure cloud environment using Terraform Infrastructure as Code (IaC). It simulates an enterprise-grade network security architecture aligned with zero trust principles and NIST 800-53 compliance standards.

## Architecture
The environment includes the following Azure resources deployed and managed entirely through code:

- **Resource Group** — Logical container for all lab resources
- **Virtual Network** — Enterprise network with a defined address space (10.0.0.0/16)
- **Subnet** — Segmented network zone (10.0.1.0/24)
- **Network Security Group** — Firewall with deny-by-default inbound rules enforcing least privilege network access
- **NSG-Subnet Association** — Binding the security ruleset to the network segment

## Security Design Decisions
- **Deny by default:** All inbound traffic is blocked unless explicitly permitted, implementing zero trust network principles
- **Infrastructure as Code:** All resources are version controlled and reproducible, enabling auditable and consistent deployments
- **No hardcoded credentials:** Authentication handled through Azure CLI, keeping secrets out of source control

## Technologies Used
- Terraform v1.15.2
- Microsoft Azure (Azure Resource Manager)
- Azure CLI
- HCL (HashiCorp Configuration Language)
- Git / GitHub

## Prerequisites
- Terraform installed
- Azure CLI installed and authenticated via az login
- Active Azure subscription

## How to Deploy
Clone the repository:Clone the repository:

    git clone https://github.com/Nkwele1/azure-terraform-security-lab.git
    cd azure-terraform-security-lab

Initialize Terraform:

    terraform init

Preview the deployment:

    terraform plan

Deploy the infrastructure:

    terraform apply

Tear down when done:

    terraform destroy

## Compliance Alignment
This lab demonstrates practical application of:
- NIST 800-53 SC-7 (Boundary Protection)
- Zero Trust Architecture principles
- Least privilege network access controls
- Auditable infrastructure through version-controlled IaC

## Skills Demonstrated
- Cloud infrastructure deployment using Infrastructure as Code
- Network security design and implementation
- Azure resource management via Terraform
- Security-first architecture aligned with enterprise DevSecOps practices