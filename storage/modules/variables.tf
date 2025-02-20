variable "config" {
  type = object({
    storage_accounts = list(object({
      name                         = string
      resource_group_name          = string
      location                     = string
      account_tier                 = string
      account_replication_type     = string
      account_kind                 = string
      access_tier                  = string
      is_hns_enabled               = string
      public_network_access_enabled = bool
      min_tls_version              = string
      tags                         = map(string)
    }))
  })
}
