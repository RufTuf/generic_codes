variable "hcl_nic" {
    type = map(object({
  nic_name            = string
  location            = string
  resource_group_name = string

  ip_configuration = object({
    name                          = string
    subnet_id                     = string
    private_ip_address_allocation = string
    })
  }
  ))
}
  

 variable "hcl_vm" {
    type = map(object({
    vm_name               = string
    location              = string
    resource_group_name   = string
    network_interface_ids = list(string)
    vm_size               = string
    storage_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })

    storage_os_disk = object({
      name              = string
      caching           = string
      create_option     = string
      managed_disk_type = string
    })
    os_profile = object({
      computer_name  = string
      admin_username = string
      admin_password = string
    })
    os_profile_linux_config = object({
      disable_password_authentication = string
    })
    tags = object({
      environment = string
    })
  }
  ))
  
}
  



