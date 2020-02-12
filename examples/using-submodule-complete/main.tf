variable "region" {
  default = "cn-shanghai"
}
provider "alicloud" {
  region = var.region
}
data "alicloud_zones" "default" {
  available_resource_creation = "MongoDB"
  multi                       = true
}
data "alicloud_vpcs" "default" {
  is_default = true
}
resource "alicloud_vswitch" "this" {
  name              = "mongodb_vsw"
  availability_zone = data.alicloud_zones.default.zones.0.multi_zone_ids.0
  vpc_id            = data.alicloud_vpcs.default.vpcs.0.id
  cidr_block        = cidrsubnet(data.alicloud_vpcs.default.vpcs.0.cidr_block, 4, 2)
}
module "mongodb_sharding_example" {
  source               = "../../modules/mongodb-sharding-3.4-wiredtiger"
  region               = var.region
  name                 = "my-mongodb-sharding"
  instance_charge_type = "PostPaid"
  zone_id              = data.alicloud_zones.default.zones.0.multi_zone_ids.0
  vswitch_id           = alicloud_vswitch.this.id
  account_password     = "shard123456"
  security_ip_list     = ["1.1.1.1", "2.2.2.2", "3.3.3.3"]
  backup_period        = ["Monday", "Wednesday", "Friday"]
  backup_time          = "02:00Z-03:00Z"
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