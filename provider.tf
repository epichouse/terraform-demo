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
    proxmox = {
      source = "bpg/proxmox"
      version = "0.70.0"
    }
  }
  backend "azurerm" {}
}
provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}
provider "proxmox" {
  endpoint = "https://srv-pve-prod-01.internal.epichouse.co.uk:8006/"
  username = "root@pam"
  password = data.azurerm_key_vault_secret.this["proxmox-vm-password"].value
}