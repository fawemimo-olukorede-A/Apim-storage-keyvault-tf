terraform {
  backend "azurerm" {
    resource_group_name = "dev-rg"   
    storage_account_name = "tdevstatestorage"
    container_name = "dev-tfstate-container"
    key = "apims.tfstate"
  }
}