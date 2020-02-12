############################
# mongodb_sharding_instance
############################
output "this_mongodb_sharding_instance_id" {
  description = "The ID of the MongoDB sharding instance. "
  value       = module.mongodb_sharding_example.this_mongodb_sharding_instance_id
}

############
# cms alarm
############
output "this_alarm_rule_effective_interval" {
  description = "The interval of effecting alarm rule. "
  value       = module.mongodb_sharding_example.this_alarm_rule_effective_interval
}

output "this_alarm_rule_id" {
  description = "The ID of the alarm rule. "
  value       = module.mongodb_sharding_example.this_alarm_rule_id
}

output "this_alarm_rule_name" {
  description = "The alarm name. "
  value       = module.mongodb_sharding_example.this_alarm_rule_name
}

output "this_alarm_rule_project" {
  description = "Monitor project name. "
  value       = module.mongodb_sharding_example.this_alarm_rule_project
}

output "this_alarm_rule_metric" {
  description = "Name of the monitoring metrics. "
  value       = module.mongodb_sharding_example.this_alarm_rule_metric
}

output "this_alarm_rule_dimensions" {
  description = "Map of the resources associated with the alarm rule. "
  value       = module.mongodb_sharding_example.this_alarm_rule_dimensions
}

output "this_alarm_rule_period" {
  description = "Index query cycle. "
  value       = module.mongodb_sharding_example.this_alarm_rule_period
}

output "this_alarm_rule_statistics" {
  description = "Statistical method. "
  value       = module.mongodb_sharding_example.this_alarm_rule_statistics
}

output "this_alarm_rule_operator" {
  description = "Alarm comparison operator. "
  value       = module.mongodb_sharding_example.this_alarm_rule_operator
}

output "this_alarm_rule_threshold" {
  description = "Alarm threshold value."
  value       = module.mongodb_sharding_example.this_alarm_rule_threshold
}

output "this_alarm_rule_triggered_count" {
  description = "Number of trigger alarm. "
  value       = module.mongodb_sharding_example.this_alarm_rule_triggered_count
}

output "this_alarm_rule_contact_groups" {
  description = "List contact groups of the alarm rule. "
  value       = module.mongodb_sharding_example.this_alarm_rule_contact_groups
}

output "this_alarm_rule_silence_time" {
  description = " Notification silence period in the alarm state. "
  value       = module.mongodb_sharding_example.this_alarm_rule_silence_time
}

output "this_alarm_rule_notify_type" {
  description = "Notification type. "
  value       = module.mongodb_sharding_example.this_alarm_rule_notify_type
}

output "this_alarm_rule_enabled" {
  description = "Whether to enable alarm rule. "
  value       = module.mongodb_sharding_example.this_alarm_rule_enabled
}

output "this_alarm_rule_webhook" {
  description = "The webhook that is called when the alarm is triggered. "
  value       = module.mongodb_sharding_example.this_alarm_rule_webhook
}

output "this_alarm_rule_cpu_utilization_status" {
  description = "The current alarm cpu utilization rule status. "
  value       = module.mongodb_sharding_example.this_alarm_rule_cpu_utilization_status
}

output "this_alarm_rule_memory_utilization_status" {
  description = "The current alarm memory utilization rule status. "
  value       = module.mongodb_sharding_example.this_alarm_rule_memory_utilization_status
}

output "this_alarm_rule_disk_utilization_status" {
  description = "The current alarm disk utilization rule status. "
  value       = module.mongodb_sharding_example.this_alarm_rule_disk_utilization_status
}

output "this_alarm_rule_intranet_in_status" {
  description = "The current alarm intranet in rule status. "
  value       = module.mongodb_sharding_example.this_alarm_rule_intranet_in_status
}

output "this_alarm_rule_intranet_out_status" {
  description = "The current alarm intranet out rule status. "
  value       = module.mongodb_sharding_example.this_alarm_rule_intranet_out_status
}
