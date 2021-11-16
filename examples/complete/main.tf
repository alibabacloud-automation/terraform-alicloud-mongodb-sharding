variable "region" {
  default = "cn-shanghai"
}
provider "alicloud" {
  region = var.region
}
locals {
  engine_version = "4.0"
  storage_engine = "WiredTiger"
}
data "alicloud_vpcs" "default" {
  is_default = true
}

resource "alicloud_cms_alarm_contact_group" "Mongodb" {
  alarm_contact_group_name = "Mongodb"
}

resource "alicloud_cms_alarm_contact_group" "AccCms" {
  alarm_contact_group_name = "AccCms"
}

module "mongodb_sharding_example" {
  source = "../../"
  region = var.region

  ####################
  # Mongodb Instance
  ####################
  engine_version       = local.engine_version
  storage_engine       = local.storage_engine
  name                 = "my-mongodb-sharding"
  instance_charge_type = "PostPaid"
  security_ip_list     = ["1.1.1.1", "2.2.2.2", "3.3.3.3"]
  vswitch_id           = data.alicloud_vpcs.default.vpcs.0.vswitch_ids.0
  // zone_id              = data.alicloud_zones.default.zones.0.multi_zone_ids.0
  account_password = "mongo123"
  backup_period    = ["Monday", "Wednesday", "Friday"]
  backup_time      = "02:00Z-03:00Z"
  shard_list = [{
    node_class   = "dds.shard.mid"
    node_storage = 10
    }, {
    node_class   = "dds.shard.mid"
    node_storage = 10
  }]
  mongo_list = [{
    node_class = "dds.mongos.mid"
    }, {
    node_class = "dds.mongos.mid"
  }]

  #############
  # cms_alarm
  #############
  alarm_rule_name            = "CmsAlarmForMongodbSharding"
  alarm_rule_statistics      = "Average"
  alarm_rule_period          = 300
  alarm_rule_operator        = "<="
  alarm_rule_threshold       = 35
  alarm_rule_triggered_count = 2
  alarm_rule_contact_groups  = ["Mongodb", "AccCms"]
}