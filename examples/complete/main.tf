data "alicloud_mongodb_zones" "default" {
}

data "alicloud_cms_alarm_contact_groups" "default" {
}

module "vpc" {
  source             = "alibaba/vpc/alicloud"
  create             = true
  vpc_name           = var.name
  vpc_cidr           = "172.16.0.0/16"
  vswitch_name       = var.name
  vswitch_cidrs      = ["172.16.0.0/21"]
  availability_zones = [data.alicloud_mongodb_zones.default.zones.0.id]
}

module "mongodb_sharding_example" {
  source = "../../"

  # Mongodb Sharding Instance
  create = true

  name                 = var.name
  engine_version       = "4.0"
  storage_engine       = "WiredTiger"
  instance_charge_type = var.instance_charge_type
  period               = var.period
  zone_id              = data.alicloud_mongodb_zones.default.zones.0.id
  vswitch_id           = module.vpc.this_vswitch_ids[0]
  account_password     = var.account_password
  security_ip_list     = var.security_ip_list
  backup_period        = var.backup_period
  backup_time          = var.backup_time
  mongo_list           = var.mongo_list
  shard_list           = var.shard_list

  # cms_alarm
  enable_alarm_rule = false

}

module "use_existing_mongodb_sharding" {
  source = "../../"

  # Mongodb Sharding Instance
  create = false

  # cms_alarm
  enable_alarm_rule = var.enable_alarm_rule

  alarm_rule_name               = var.alarm_rule_name
  existing_instance_id          = module.mongodb_sharding_example.this_mongodb_sharding_instance_id
  alarm_rule_statistics         = var.alarm_rule_statistics
  alarm_rule_operator           = var.alarm_rule_operator
  alarm_rule_threshold          = var.alarm_rule_threshold
  alarm_rule_triggered_count    = var.alarm_rule_triggered_count
  alarm_rule_period             = var.alarm_rule_period
  alarm_rule_contact_groups     = data.alicloud_cms_alarm_contact_groups.default.names
  alarm_rule_silence_time       = var.alarm_rule_silence_time
  alarm_rule_effective_interval = var.alarm_rule_effective_interval

}

module "mongodb_sharding_3_4_wiredtiger" {
  source = "../../modules/mongodb-sharding-3.4-wiredtiger"

  # Mongodb Instance
  name                 = var.name
  instance_charge_type = var.instance_charge_type
  period               = var.period
  zone_id              = data.alicloud_mongodb_zones.default.zones.0.id
  vswitch_id           = module.vpc.this_vswitch_ids[0]
  account_password     = var.account_password
  security_ip_list     = var.security_ip_list
  backup_period        = var.backup_period
  backup_time          = var.backup_time
  mongo_list           = var.mongo_list
  shard_list           = var.shard_list

  # cms_alarm
  enable_alarm_rule             = var.enable_alarm_rule
  alarm_rule_name               = var.alarm_rule_name
  alarm_rule_silence_time       = var.alarm_rule_silence_time
  alarm_rule_effective_interval = var.alarm_rule_effective_interval
  alarm_rule_statistics         = var.alarm_rule_statistics
  alarm_rule_period             = var.alarm_rule_period
  alarm_rule_operator           = var.alarm_rule_operator
  alarm_rule_threshold          = var.alarm_rule_threshold
  alarm_rule_triggered_count    = var.alarm_rule_triggered_count
  alarm_rule_contact_groups     = data.alicloud_cms_alarm_contact_groups.default.names

}

module "mongodb_sharding_4_0_wiredtiger" {
  source = "../../modules/mongodb-sharding-4.0-wiredtiger"

  # Mongodb Instance
  name                 = var.name
  instance_charge_type = var.instance_charge_type
  period               = var.period
  zone_id              = data.alicloud_mongodb_zones.default.zones.0.id
  vswitch_id           = module.vpc.this_vswitch_ids[0]
  account_password     = var.account_password
  security_ip_list     = var.security_ip_list
  backup_period        = var.backup_period
  backup_time          = var.backup_time
  mongo_list           = var.mongo_list
  shard_list           = var.shard_list

  # cms_alarm
  enable_alarm_rule             = var.enable_alarm_rule
  alarm_rule_name               = var.alarm_rule_name
  alarm_rule_silence_time       = var.alarm_rule_silence_time
  alarm_rule_effective_interval = var.alarm_rule_effective_interval
  alarm_rule_statistics         = var.alarm_rule_statistics
  alarm_rule_period             = var.alarm_rule_period
  alarm_rule_operator           = var.alarm_rule_operator
  alarm_rule_threshold          = var.alarm_rule_threshold
  alarm_rule_triggered_count    = var.alarm_rule_triggered_count
  alarm_rule_contact_groups     = data.alicloud_cms_alarm_contact_groups.default.names

}

module "mongodb_sharding_4_2_wiredtiger" {
  source = "../../modules/mongodb-sharding-4.2-wiredtiger"

  # Mongodb Instance
  name                 = var.name
  instance_charge_type = var.instance_charge_type
  period               = var.period
  zone_id              = data.alicloud_mongodb_zones.default.zones.0.id
  vswitch_id           = module.vpc.this_vswitch_ids[0]
  account_password     = var.account_password
  security_ip_list     = var.security_ip_list
  backup_period        = var.backup_period
  backup_time          = var.backup_time
  mongo_list           = var.mongo_list
  shard_list           = var.shard_list

  # cms_alarm
  enable_alarm_rule             = var.enable_alarm_rule
  alarm_rule_name               = var.alarm_rule_name
  alarm_rule_silence_time       = var.alarm_rule_silence_time
  alarm_rule_effective_interval = var.alarm_rule_effective_interval
  alarm_rule_statistics         = var.alarm_rule_statistics
  alarm_rule_period             = var.alarm_rule_period
  alarm_rule_operator           = var.alarm_rule_operator
  alarm_rule_threshold          = var.alarm_rule_threshold
  alarm_rule_triggered_count    = var.alarm_rule_triggered_count
  alarm_rule_contact_groups     = data.alicloud_cms_alarm_contact_groups.default.names

}