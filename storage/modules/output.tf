output "storage_account_names" {
  value = { for key, storage in azurerm_storage_account.storage_accounts : key => storage.name }
}

output "storage_account_ids" {
  value = { for key, storage in azurerm_storage_account.storage_accounts : key => storage.id }
}
