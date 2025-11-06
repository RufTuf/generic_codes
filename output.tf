output "resource_group_id" {
  description = "Resource Group ID"
  value       = module.rg.resource_group_id
}

output "vnet_id" {
  description = "Virtual Network ID"
  value       = module.vnet.vnet_id
}

output "subnet_ids" {
  description = "Map of subnet names to IDs"
  value       = module.subnet.subnet_ids
}

output "public_ip" {
  description = "Public IP Address"
  value       = module.pip.public_ip
}

output "key_vault_id" {
  description = "Key Vault ID"
  value       = module.key_vault.key_vault_id
}

output "key_vault_uri" {
  description = "Key Vault URI"
  value       = module.key_vault.key_vault_uri
}