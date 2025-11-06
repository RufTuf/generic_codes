resource "azurerm_key_vault" "kv" {
    for_each = var.hcl_keyvault
  name                       = each.value.name
  location                   = each.value.location
  resource_group_name        = each.value.resource_group_name
  tenant_id                  = each.value.tenant_id
  sku_name                   = each.value.sku_name
  soft_delete_retention_days = each.value.soft_delete_retention_days

  access_policy {
    tenant_id = each.value.tenant_id
    object_id = each.value.object_id

    key_permissions = each.value.key_permissions
    secret_permissions = each.value.secret_permissions
 
  }
}

resource "azurerm_key_vault_secret" "kvs" {
    for_each = var.hcl_kvsecret
  name         = each.value.name
  value        = each.value.value
  key_vault_id = each.value.key_vault_id
}