terraform {
  backend "azurerm" {
    resource_group_name = "dev-rg"   
    storage_account_name = "devstatestorage"
    container_name = "dev-tfstate-container"
    key = "stund.tfstate"
  }
}