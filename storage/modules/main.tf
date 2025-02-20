resource "azurerm_storage_account" "storage_accounts" {
  for_each = { for x in var.config.storage_accounts : x.name => x }
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  account_kind             = each.value.account_kind
  access_tier              = each.value.access_tier
  is_hns_enabled           = coalesce(each.value.is_hns_enabled, "true")
  public_network_access_enabled = each.value.public_network_access_enabled
  min_tls_version          = each.value.min_tls_version

  tags = {
    for k, v in each.value.tags:
    k => k == "Name" ? "${each.value.storage_prefix}-${v}" : v
  }

}
