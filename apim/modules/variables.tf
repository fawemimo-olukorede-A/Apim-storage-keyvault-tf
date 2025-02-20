variable "config" {
  type = object({
    apim = list(object({
      name                          = string
      location                      = string
      resource_group_name           = string
      publisher_name                = string
      publisher_email               = string
      sku_name                      = optional(string)
      subnet_id                     = string
      virtual_network_type          = optional(string)
      notification_sender_email     = string
      identity                      = map(string)
      hostname_configuration        = map(map(string))
      public_network_access_enabled = optional(string)
      default_ssl_binding           = optional(string)
      key_vault_id                  = optional(string)
      ssl_cert                      = string
      tags                          = map(string)
    }))
  })
}
