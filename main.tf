provider "alicloud" {
  version                 = ">=1.64.0"
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/mongodb_sharding"
}

resource "alicloud_mongodb_sharding_instance" "this" {
  count                = var.existing_instance_id != "" ? 0 : var.create ? 1 : 0
  engine_version       = var.engine_version
  storage_engine       = var.storage_engine
  name                 = var.name
  instance_charge_type = var.instance_charge_type
  period               = var.period
  zone_id              = var.zone_id
  vswitch_id           = var.vswitch_id
  account_password     = var.account_password
  security_ip_list     = var.security_ip_list
  backup_period        = var.backup_period
  backup_time          = var.backup_time
  dynamic "mongo_list" {
    for_each = var.mongo_list
    content {
      node_class = lookup(mongo_list.value, "node_class")
    }
  }
  dynamic "shard_list" {
    for_each = var.shard_list
    content {
      node_class   = lookup(shard_list.value, "node_class")
      node_storage = lookup(shard_list.value, "node_storage")
    }
  }
}

