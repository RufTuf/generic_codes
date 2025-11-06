variable "hcl_keyvault" {
    description = "Map of Key Vault definitions"
    type = map(object({
        name                       = string
        location                   = string
        resource_group_name        = string
        tenant_id                  = string
        sku_name                   = string
        soft_delete_retention_days = number
        object_id                  = string
        key_permissions            = list(string)
        secret_permissions         = list(string)
    }))
}

variable "hcl_kvsecret" {
    description = "Map of Key Vault Secret definitions"
    type = map(object({
        name         = string
        value        = string
        key_vault_id = string
    })) 
  
}

