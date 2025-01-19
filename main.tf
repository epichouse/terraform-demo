resource "proxmox_virtual_environment_vm" "this" {
  for_each = local.config.ubuntu_virtual_machines
  name        = each.key
  agent {enabled = "true"}
  node_name = "srv-pve-prod-01" # Change me
  description = each.value.description
  vm_id     = each.value.id
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
        address = each.value.network.ip_address
        gateway = each.value.network.gateway
      }
    }
    user_account {
      keys = [data.azurerm_key_vault_secret.this["proxmox-ssh-key"].value]
      username = "dan"
      password = data.azurerm_key_vault_secret.this["proxmox-vm-password"].value

    }
  }
  cpu {
    sockets = 1
    cores = each.value.compute.cpus
    type = "host"
    units = 1024
    architecture = "x86_64"
  }
  memory {
    dedicated = each.value.compute.memory
    floating = each.value.compute.memory
    shared = 0
  }
  dynamic "network_device" {
    for_each = each.value.network_devices
  }
  network_device {
    bridge = each.key
    enabled = each.value.enabled
    firewall = each.value.firewall
    disconnected = each.value.disconnected
    vlan_id = each.value.vlan_id
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
    ]
  }
}