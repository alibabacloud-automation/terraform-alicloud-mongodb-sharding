provider "alicloud" {
  version                 = ">=1.64.0"
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/mongodb-sharding"
}
locals {
  engine_version = "4.2"
  storage_engine = "WiredTiger"
}
module "mongodb_sharding" {
  source               = "../.."
  region               = var.region
  engine_version       = local.engine_version
  storage_engine       = local.storage_engine
  name                 = var.name
  instance_charge_type = var.instance_charge_type
  period               = var.period
  zone_id              = var.zone_id
  vswitch_id           = var.vswitch_id
  account_password     = var.account_password
  security_ip_list     = var.security_ip_list
  backup_period        = var.backup_period
  backup_time          = var.backup_time
  mongo_list           = var.mongo_list
  shard_list           = var.shard_list
}
