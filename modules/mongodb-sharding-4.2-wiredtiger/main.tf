provider "alicloud" {
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
  source = "../.."
  region = var.region

  ############################
  # Mongodb Sharding instance
  ############################
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

  #############
  # cms_alarm
  #############
  alarm_rule_name               = var.alarm_rule_name
  alarm_rule_silence_time       = var.alarm_rule_silence_time
  enable_alarm_rule             = var.enable_alarm_rule
  alarm_rule_effective_interval = var.alarm_rule_effective_interval
  alarm_rule_statistics         = var.alarm_rule_statistics
  alarm_rule_period             = var.alarm_rule_period
  alarm_rule_operator           = var.alarm_rule_operator
  alarm_rule_threshold          = var.alarm_rule_threshold
  alarm_rule_triggered_count    = var.alarm_rule_triggered_count
  alarm_rule_contact_groups     = var.alarm_rule_contact_groups
}
