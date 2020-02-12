variable "region" {
  default = "cn-shanghai"
}
provider "alicloud" {
  region = var.region
}
module "mongodb_sharding_example" {
  source = "../../"
  region = var.region

  ####################
  # Mongodb Instance
  ####################
  existing_instance_id = "dds-uf6eea55dd17c344"

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