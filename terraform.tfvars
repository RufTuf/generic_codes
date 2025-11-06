# -------------------------# -------------------------

# Resource Group Variables# Resource Group Variables

# -------------------------# -------------------------

hcl-rg1 = {hcl-rg1 = {

  "rg-01" = {  "rg-01" = {

    name       = "hcl-rg-002"    name       = "hcl-rg-002"

    location   = "eastus"    location   = "eastus"

    managed_by = "Team-DevOps"    managed_by = "Team-DevOps"

    tags = {    tags = {

      environment = "Development"      environment = "Development"

      project     = "Terraform-Azure-Infra"      project     = "Terraform-Azure-Infra"

    }    }

  }  }

}}



# -------------------------# -------------------------

# Virtual Network Variables# Virtual Network Variables

# -------------------------# -------------------------

hcl_vnet1 = {hcl_vnet1 = {

  "vnet-01" = {  "vnet-01" = {

    name                = "hcl-vnet-001"    name                = "hcl-vnet-001"

    location            = "eastus"    location            = "eastus"

    resource_group_name = "hcl-rg-002"    resource_group_name = "hcl-rg-002"

    address_space       = ["10.0.0.0/16"]    address_space       = ["10.0.0.0/16"]

    tags = {    tags = {

      environment = "Development"      environment = "Development"

    }    }

  }  }

}}



# -------------------------# -------------------------

# Subnet Variables# Subnet Variables

# -------------------------# -------------------------

subnets1 = {subnets1 = {

  "subnet-01" = {  "subnet-01" = {

    name                 = "frontend-subnet"    name                 = "frontend-subnet"

    resource_group_name  = "hcl-rg-002"    resource_group_name  = "hcl-rg-002"

    virtual_network_name = "hcl-vnet-001"    virtual_network_name = "hcl-vnet-001"

    address_prefixes     = ["10.0.1.0/24"]    address_prefixes     = ["10.0.1.0/24"]

  }  }

  "subnet-02" = {  "subnet-02" = {

    name                 = "backend-subnet"    name                 = "backend-subnet"

    resource_group_name  = "hcl-rg-002"    resource_group_name  = "hcl-rg-002"

    virtual_network_name = "hcl-vnet-001"    virtual_network_name = "hcl-vnet-001"

    address_prefixes     = ["10.0.2.0/24"]    address_prefixes     = ["10.0.2.0/24"]

  }  }

}}



# -------------------------# -------------------------

# Public IP Variables# Public IP Variables

# -------------------------# -------------------------

hcl_pip1 = {hcl_pip1 = {

  "pip-01" = {  "pip-01" = {

    name                = "vm-public-ip"    name                = "vm-public-ip"

    resource_group_name = "hcl-rg-002"    resource_group_name = "hcl-rg-002"

    location            = "eastus"    location            = "eastus"

    allocation_method   = "Static"    allocation_method   = "Static"

    tags = {    tags = {

      environment = "Development"      environment = "Development"

    }    }

  }  }

}}



# -------------------------# -------------------------

# Network Interface Variables# Network Interface Variables

# -------------------------# -------------------------

hcl_nic1 = {hcl_nic1 = {

  "nic-01" = {  "nic-01" = {

    nic_name            = "hcl-vm-nic"    nic_name            = "hcl-vm-nic"

    location            = "eastus"    location            = "eastus"

    resource_group_name = "hcl-rg-002"    resource_group_name = "hcl-rg-002"

    ip_configuration = {    ip_configuration = {

      name                          = "internal"      name                          = "internal"

      subnet_id                     = null  # This will be set by the module using the subnet output      subnet_id                     = null  # This will be set by the module using the subnet output

      private_ip_address_allocation = "Dynamic"      private_ip_address_allocation = "Dynamic"

    }    }

  }  }

}}



# -------------------------# -------------------------

# Virtual Machine Variables# Virtual Machine Variables

# -------------------------# -------------------------

hcl_vm1 = {hcl_vm1 = {

  "vm-01" = {  "vm-01" = {

    vm_name               = "hcl-vm-001"    vm_name               = "hcl-vm-001"

    location              = "eastus"    location              = "eastus"

    resource_group_name   = "hcl-rg-002"    resource_group_name   = "hcl-rg-002"

    network_interface_ids = ["/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/hcl-rg-002/providers/Microsoft.Network/networkInterfaces/hcl-vm-nic"]    network_interface_ids = ["/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/hcl-rg-002/providers/Microsoft.Network/networkInterfaces/hcl-vm-nic"]

    vm_size              = "Standard_B1s"    vm_size               = "Standard_B1s"



    storage_image_reference = {    storage_image_reference = {

      publisher = "Canonical"      publisher = "Canonical"

      offer    = "UbuntuServer"      offer     = "UbuntuServer"

      sku      = "18.04-LTS"      sku       = "18.04-LTS"

      version  = "latest"      version   = "latest"

    }    }



    storage_os_disk = {    storage_os_disk = {

      name              = "hcl-os-disk-001"      name              = "hcl-vm-001-os-disk"

      caching           = "ReadWrite"      caching           = "ReadWrite"

      create_option     = "FromImage"      create_option     = "Attach"

      managed_disk_type = "Standard_LRS"      managed_disk_type = "Standard_LRS"

      managed_disk_id   = "/subscriptions/1a39c6ac-4bf8-406a-be20-298e2ae5b5ce/resourceGroups/hcl-rg-002/providers/Microsoft.Compute/disks/hcl-vm-001-os-disk"      managed_disk_id   = "/subscriptions/1a39c6ac-4bf8-406a-be20-298e2ae5b5ce/resourceGroups/hcl-rg-002/providers/Microsoft.Compute/disks/hcl-vm-001-os-disk"

    }    }



    os_profile = {    os_profile = {

      computer_name  = "hcl-vm-001"      computer_name  = "hcl-vm-001"

      admin_username = "azureuser"      admin_username = "azureuser"

      admin_password = "Password@1234"      admin_password = "Password@1234"

    }    }



    os_profile_linux_config = {    os_profile_linux_config = {

      disable_password_authentication = false      disable_password_authentication = false

    }    }



    tags = {    tags = {

      environment = "Development"      environment = "Development"

    }    }

  }  }

}}



# -------------------------

# Key Vault Variables# -------------------------

# -------------------------# Key Vault Variables

hcl_keyvault1 = {# -------------------------

  "keyvault1" = {

    name                       = "hcl-kv-001"hcl_keyvault1 = {

    location                   = "eastus"  "keyvault1" = {

    resource_group_name        = "hcl-rg-002"    name                       = "hcl-kv-001"

    tenant_id                  = "9fea2d6d-ea1f-43f2-a728-271ee317f056"    location                   = "eastus"

    sku_name                  = "standard"    resource_group_name        = "hcl-rg-002"

    soft_delete_retention_days = 7    tenant_id                  = "9fea2d6d-ea1f-43f2-a728-271ee317f056"

    object_id                 = "b3c81ba2-bc63-433e-ab8a-2b08fae139fe"    sku_name                   = "standard"

    key_permissions           = ["Get", "List", "Create", "Delete"]    soft_delete_retention_days = 7

    secret_permissions        = ["Get", "List", "Set", "Delete"]    object_id                  = "b3c81ba2-bc63-433e-ab8a-2b08fae139fe"

  }    key_permissions            = ["Get", "List", "Create", "Delete"]

}    secret_permissions         = ["Get", "List", "Set", "Delete"]

  }

hcl_kvsecret1 = {}

  "kv-01" = {

    name         = "hcl-secret-001"hcl_kvsecret1 = {

    value        = "mySecretValue"  "kv-01" = {

    key_vault_id = "/subscriptions/1a39c6ac-4bf8-406a-be20-298e2ae5b5ce/resourceGroups/hcl-rg-002/providers/Microsoft.KeyVault/vaults/hcl-kv-001"    name         = "hcl-secret-001"

  }    value        = "mySecretValue"

}    key_vault_id = "/subscriptions/1a39c6ac-4bf8-406a-be20-298e2ae5b5ce/resourceGroups/hcl-rg-002/providers/Microsoft.KeyVault/vaults/hcl-kv-001"
  }
}
