output "subnet_ids" {
  description = "The IDs of the created subnets"
  value = {
    for k, v in azurerm_subnet.hcl_subnet : k => v.id
  }
}