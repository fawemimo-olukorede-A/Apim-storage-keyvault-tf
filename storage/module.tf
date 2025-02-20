module "mssql_mod" {
  source =  "../../../modules/storage"
  config = local.env.storageaccount

}