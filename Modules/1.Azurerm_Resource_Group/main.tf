resource "azurerm_resource_group" "hcl_rg" {
    for_each = var.hcl-rg
    name     = each.value.name
    location = each.value.location
  managed_by = each.value.managed_by
  tags = each.value.tags  
}