resource "azurerm_key_vault" "key_vault" {
  for_each                    = { for x in var.config.key-vault : x.name => x }
  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  tenant_id                   = each.value.tenant_id
  soft_delete_retention_days  = each.value.soft_delete_retention_days
  purge_protection_enabled    = each.value.purge_protection_enabled
  sku_name                    = each.value.sku_name


  tags = each.value.tags
}

output "key_vault_id" {
  value = { for name, kv in azurerm_key_vault.key_vault : name => kv.id }
}
