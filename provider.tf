terraform {
  required_version = ">= 1.3.0"
  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.77.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
  backend "azurerm" {}
}
