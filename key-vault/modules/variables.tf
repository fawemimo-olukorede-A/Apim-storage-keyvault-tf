variable "config" {
  type = object({
    key-vault = list(object({
      name                        = string
      location                    = string
      resource_group_name         = string
      tenant_id                   = string
      soft_delete_retention_days  = optional(number)
      purge_protection_enabled    = optional(bool)
      sku_name                    = string

      tags = optional(map(string))
    }))
  })
}
