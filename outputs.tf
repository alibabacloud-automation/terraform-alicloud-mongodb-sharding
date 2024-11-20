############################
# mongodb_sharding_instance
############################
output "this_mongodb_sharding_instance_id" {
  description = "The ID of the MongoDB sharding instance. "
  value       = local.this_instance_id
}

output "this_mongodb_sharding_instance_engine_version" {
  description = "The engine version of the MongoDB sharding instance. "
  value       = concat(alicloud_mongodb_sharding_instance.this[*].engine_version, [""])[0]
}

output "this_mongodb_sharding_instance_storage_engine" {
  description = "The storage engine used by the MongoDB sharding instance. "
  value       = concat(alicloud_mongodb_sharding_instance.this[*].storage_engine, [""])[0]
}

output "this_mongodb_sharding_instance_name" {
  description = "The name of MongoDB sharding instance. "
  value       = concat(alicloud_mongodb_sharding_instance.this[*].name, [""])[0]
}

output "this_mongodb_sharding_instance_charge_type" {
  description = "The billing method of the MongoDB sharding instance. "
  value       = concat(alicloud_mongodb_sharding_instance.this[*].instance_charge_type, [""])[0]
}

output "this_mongodb_sharding_instance_period" {
  description = "The duration that you will buy MongoDB sharding instance. "
  value       = concat(alicloud_mongodb_sharding_instance.this[*].period, [""])[0]
}

output "this_mongodb_sharding_instance_zone_id" {
  description = "The Zone to launch the MongoDB sharding instance. "
  value       = concat(alicloud_mongodb_sharding_instance.this[*].zone_id, [""])[0]
}

output "this_mongodb_sharding_instance_vswitch_id" {
  description = "The virtual switch ID to launch MongoDB sharding instances in one VPC. "
  value       = concat(alicloud_mongodb_sharding_instance.this[*].vswitch_id, [""])[0]
}

output "this_mongodb_sharding_instance_security_ip_list" {
  description = "IP whitelist of MongoDB sharding instances. "
  value       = concat(alicloud_mongodb_sharding_instance.this[*].security_ip_list, [""])[0]
}

output "this_mongodb_sharding_instance_mongo_list" {
  description = "The mongo-node count can be purchased. "
  value       = concat(alicloud_mongodb_sharding_instance.this[*].mongo_list, [""])[0]
}

output "this_mongodb_sharding_instance_shard_list" {
  description = "MongoDB sharding Instance backup period. "
  value       = concat(alicloud_mongodb_sharding_instance.this[*].shard_list, [""])[0]
}

output "this_mongodb_sharding_instance_backup_period" {
  description = "MongoDB sharding instance backup time. "
  value       = concat(alicloud_mongodb_sharding_instance.this[*].backup_period, [""])[0]
}

output "this_mongodb_sharding_instance_backup_time" {
  description = "MongoDB sharding instance backup time. "
  value       = concat(alicloud_mongodb_sharding_instance.this[*].backup_time, [""])[0]
}

############
# cms alarm
############
output "this_alarm_rule_effective_interval" {
  description = "The interval of effecting alarm rule. "
  value       = concat(alicloud_cms_alarm.cpu_utilization[*].effective_interval, [""])[0]
}

output "this_alarm_rule_id" {
  description = "The ID of the alarm rule. "
  value       = concat(alicloud_cms_alarm.cpu_utilization[*].id, [""])[0]
}

output "this_alarm_rule_name" {
  description = "The alarm name. "
  value       = concat(alicloud_cms_alarm.cpu_utilization[*].name, [""])[0]
}

output "this_alarm_rule_project" {
  description = "Monitor project name. "
  value       = concat(alicloud_cms_alarm.cpu_utilization[*].project, [""])[0]
}

output "this_alarm_rule_metric" {
  description = "Name of the monitoring metrics. "
  value       = concat(alicloud_cms_alarm.cpu_utilization[*].metric, [""])[0]
}

output "this_alarm_rule_dimensions" {
  description = "Map of the resources associated with the alarm rule. "
  value       = concat(alicloud_cms_alarm.cpu_utilization[*].dimensions, [""])[0]
}

output "this_alarm_rule_period" {
  description = "Index query cycle. "
  value       = concat(alicloud_cms_alarm.cpu_utilization[*].period, [""])[0]
}

output "this_alarm_rule_statistics" {
  description = "Statistical method. "
  value       = concat(alicloud_cms_alarm.cpu_utilization[*].statistics, [""])[0]
}

output "this_alarm_rule_operator" {
  description = "Alarm comparison operator. "
  value       = concat(alicloud_cms_alarm.cpu_utilization[*].operator, [""])[0]
}

output "this_alarm_rule_threshold" {
  description = "Alarm threshold value."
  value       = concat(alicloud_cms_alarm.cpu_utilization[*].threshold, [""])[0]
}

output "this_alarm_rule_triggered_count" {
  description = "Number of trigger alarm. "
  value       = concat(alicloud_cms_alarm.cpu_utilization[*].triggered_count, [""])[0]
}

output "this_alarm_rule_contact_groups" {
  description = "List contact groups of the alarm rule. "
  value       = concat(alicloud_cms_alarm.cpu_utilization[*].contact_groups, [""])[0]
}

output "this_alarm_rule_silence_time" {
  description = " Notification silence period in the alarm state. "
  value       = concat(alicloud_cms_alarm.cpu_utilization[*].silence_time, [""])[0]
}

output "this_alarm_rule_notify_type" {
  description = "Notification type. "
  value       = concat(alicloud_cms_alarm.cpu_utilization[*].notify_type, [""])[0]
}

output "this_alarm_rule_enabled" {
  description = "Whether to enable alarm rule. "
  value       = concat(alicloud_cms_alarm.cpu_utilization[*].enabled, [""])[0]
}

output "this_alarm_rule_webhook" {
  description = "The webhook that is called when the alarm is triggered. "
  value       = concat(alicloud_cms_alarm.cpu_utilization[*].webhook, [""])[0]
}

output "this_alarm_rule_cpu_utilization_status" {
  description = "The current alarm cpu utilization rule status. "
  value       = concat(alicloud_cms_alarm.cpu_utilization[*].status, [""])[0]
}

output "this_alarm_rule_memory_utilization_status" {
  description = "The current alarm memory utilization rule status. "
  value       = concat(alicloud_cms_alarm.memory_utilization[*].status, [""])[0]
}

output "this_alarm_rule_disk_utilization_status" {
  description = "The current alarm disk utilization rule status. "
  value       = concat(alicloud_cms_alarm.disk_utilization[*].status, [""])[0]
}

output "this_alarm_rule_intranet_in_status" {
  description = "The current alarm intranet in rule status. "
  value       = concat(alicloud_cms_alarm.intranet_in[*].status, [""])[0]
}

output "this_alarm_rule_intranet_out_status" {
  description = "The current alarm intranet out rule status. "
  value       = concat(alicloud_cms_alarm.intranet_out[*].status, [""])[0]
}