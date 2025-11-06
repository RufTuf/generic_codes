variable "hcl-rg1" {
  type = map(object({
    name       = string
    location   = string
    managed_by = string
    tags = object({
      environment = string
      project     = string
    })
  }))
}

variable "hcl_vnet1" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags = object({
      environment = string
    })
  }))
}

variable "subnets1" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

variable "hcl_vm1" {
  type = map(object({
    vm_name               = string
    location              = string
    resource_group_name   = string
    network_interface_ids = list(string)
    vm_size              = string

    storage_image_reference = object({
      publisher = string
      offer    = string
      sku      = string
      version  = string
    })

    storage_os_disk = object({
      name              = string
      caching           = string
      create_option     = string
      managed_disk_type = string
      managed_disk_id   = string
    })

    os_profile = object({
      computer_name  = string
      admin_username = string
      admin_password = string
    })

    os_profile_linux_config = object({
      disable_password_authentication = bool
    })

    tags = object({
      environment = string
    })
  }))
}

variable "hcl_nic1" {
  type = map(object({
    nic_name            = string
    location            = string
    resource_group_name = string
    ip_configuration = object({
      name                          = string
      subnet_id                     = string
      private_ip_address_allocation = string
    })
  }))
}

variable "hcl_pip1" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    tags = object({
      environment = string
    })
  }))
}

variable "hcl_keyvault1" {
  type = map(object({
    name                       = string
    location                   = string
    resource_group_name        = string
    tenant_id                  = string
    sku_name                   = string
    soft_delete_retention_days = number
    object_id                  = string
    key_permissions           = list(string)
    secret_permissions        = list(string)
  }))
}

variable "hcl_kvsecret1" {
  type = map(object({
    name         = string
    value        = string
    key_vault_id = string
  }))
}