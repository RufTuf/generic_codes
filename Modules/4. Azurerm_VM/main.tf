resource "azurerm_network_interface" "nic" {
    for_each = var.hcl_nic
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ip_configuration.name
    subnet_id                     = each.value.ip_configuration.subnet_id
    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
  }
}

resource "azurerm_virtual_machine" "vm" {
    for_each = var.hcl_vm
  name                  = each.value.vm_name 
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  # Reference the NIC resource(s) created in this module so Terraform creates
  # the NIC(s) first and the VM implicitly depends on them.
  # This expression returns a list of NIC ids (list(string)) which is the
  # expected type for `network_interface_ids`.
  # NOTE: For multiple VMs you should provide an explicit mapping (e.g. add
  # a `nic_key` field to each vm object) so each VM uses the correct NIC(s).
  network_interface_ids = [for k, v in azurerm_network_interface.nic : v.id]
  vm_size               = each.value.vm_size

  storage_image_reference {
    publisher = each.value.storage_image_reference.publisher
    offer     = each.value.storage_image_reference.offer
    sku       = each.value.storage_image_reference.sku
    version   = each.value.storage_image_reference.version
  }
  storage_os_disk {
    # Use a VM-specific disk name to avoid conflicts with pre-existing disks.
    # This will produce unique names like "hcl-vm-001-os-disk".
    name              = "${each.value.vm_name}-os-disk"
    caching           = each.value.storage_os_disk.caching
    create_option     = each.value.storage_os_disk.create_option
    managed_disk_type = each.value.storage_os_disk.managed_disk_type
  }
  os_profile {
    computer_name  = each.value.os_profile.computer_name
    admin_username = each.value.os_profile.admin_username
    admin_password = each.value.os_profile.admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = each.value.os_profile_linux_config.disable_password_authentication
  }
  tags = {
    environment = each.value.tags.environment
  }
}
