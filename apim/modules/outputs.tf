output "apim_output" {
  value = [for x in azurerm_api_management.apim :
    {
      apim_name = x.name
      apim_url  = x.gateway_url
  }]
}


