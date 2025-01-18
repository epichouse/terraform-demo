resource "proxmox_virtual_environment_vm" "this" {
  name        = "vm-tf-ldn-test-01" # Change me
  agent {enabled = "true"}
  node_name = "srv-pve-prod-01" # Change me
  description = "Test VM" # Change me
  vm_id     = 188 # Change me
  tags        = ["testing"]
  on_boot = false
  started = false
  bios = "ovmf"  
  stop_on_destroy = true
  machine = "q35"
    clone {
    vm_id = 191
    full = true
    }
  initialization {
    datastore_id = "local-zfs"
    interface = "ide2"
    upgrade = false
    ip_config {
      ipv4 {
        address = "10.100.0.104/24"
        gateway = "10.100.0.1"
      }
    }
    user_account {
      keys = data.azurerm_key_vault_secret.this["proxmox-ssh-key"].value
      username = "dan"
      password = data.azurerm_key_vault_secret.this["proxmox-vm-password"].value

    }
  }
  cpu {
    sockets = 1
    cores = 2 # Change me
    type = "host"
    units = 1024
    architecture = "x86_64"
  }
  memory {
    dedicated = 2048 # Change me
    floating = 2048 # Change me
    shared = 0
  }
  network_device {
    bridge = "vmbr0"
    enabled = true
    firewall = false
    disconnected = false
 #   vlan_id = var.vm_vlan
  }
  lifecycle {
    ignore_changes = [
      efi_disk,
      clone,
      operating_system,
      agent,
      keyboard_layout,
      vga,
      started,
      reboot,
      cpu[0].architecture,
      memory[0].floating,
      startup,
      serial_device,
      disk,
      initialization[0].dns,
      network_device[0].mac_address,
      network_interface_names,
    ]
  }
}