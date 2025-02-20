resource "azurerm_api_management" "apim" {
  for_each                      = { for x in var.config.apim : x.name => x }
  name                          = each.value.name
  location                      = each.value.location
  resource_group_name           = each.value.resource_group_name
  publisher_name                = each.value.publisher_name
  publisher_email               = each.value.publisher_email
  sku_name                      = coalesce(each.value.sku_name, "Premium_1")
  virtual_network_type          = coalesce(each.value.virtual_network_type, "Internal")
  notification_sender_email     = each.value.notification_sender_email
  public_network_access_enabled = coalesce(each.value.public_network_access_enabled, "false")
  identity {
    type = each.value.identity.type
  }
  virtual_network_configuration {
    subnet_id = each.value.subnet_id
  }

  hostname_configuration {
    proxy {
      host_name           = each.value.hostname_configuration.proxy.host_name
      default_ssl_binding = each.value.ssl_cert == "true" ? coalesce(each.value.default_ssl_binding, "true") : null
      key_vault_id        = each.value.ssl_cert == "true" ? each.value.key_vault_id : null
    }
  }

  tags = each.value.tags
}
