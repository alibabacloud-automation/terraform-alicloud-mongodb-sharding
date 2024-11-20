data "alicloud_zones" "default" {
  available_resource_creation = "MongoDB"
  multi                       = true
}
resource "alicloud_vpc" "default" {
  cidr_block = "172.17.3.0/24"
}

resource "alicloud_vswitch" "this" {
  vswitch_name = "mongodb_vsw"
  zone_id      = data.alicloud_zones.default.zones[0].multi_zone_ids[0]
  vpc_id       = alicloud_vpc.default.id
  cidr_block   = "172.17.3.0/24"
}
module "mongodb_sharding_example" {
  source = "../../modules/mongodb-sharding-4.2-wiredtiger"

  name                 = "my-mongodb-sharding"
  instance_charge_type = "PostPaid"
  zone_id              = data.alicloud_zones.default.zones[0].multi_zone_ids[0]
  vswitch_id           = alicloud_vswitch.this.id
  account_password     = "shard123456"
  security_ip_list     = ["1.1.1.1", "2.2.2.2", "3.3.3.3"]
  backup_period        = ["Monday", "Wednesday", "Friday"]
  backup_time          = "02:00Z-03:00Z"
  shard_list = [
    {
      "node_class"   = "dds.shard.mid",
      "node_storage" = "10",
    },
    {
      "node_class"        = "dds.shard.standard",
      "node_storage"      = "20",
      "readonly_replicas" = "1",
    }
  ]
  mongo_list = [
    {
      node_class = "dds.mongos.mid",
    },
    {
      node_class = "dds.mongos.mid",
    }
  ]

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
