locals {
  this_instance_id = var.existing_instance_id != "" ? var.existing_instance_id : concat(alicloud_mongodb_sharding_instance.this[*].id, [""])[0]
  project          = "acs_mongodb"
}

resource "alicloud_mongodb_sharding_instance" "this" {
  count                = var.create ? 1 : 0
  name                 = var.name
  engine_version       = var.engine_version
  storage_engine       = var.storage_engine
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
      node_class = mongo_list.value["node_class"]
    }
  }
  dynamic "shard_list" {
    for_each = var.shard_list
    content {
      node_class   = shard_list.value["node_class"]
      node_storage = shard_list.value["node_storage"]
    }
  }
}

resource "alicloud_cms_alarm" "cpu_utilization" {
  count   = var.enable_alarm_rule ? 1 : 0
  enabled = var.enable_alarm_rule
  name    = var.alarm_rule_name
  project = local.project
  metric  = "CPUUtilization"
  dimensions = {
    instanceId = local.this_instance_id
    device     = "/dev/vda1,/dev/vdb1"
  }
  escalations_critical {
    statistics          = var.alarm_rule_statistics
    comparison_operator = var.alarm_rule_operator
    threshold           = var.alarm_rule_threshold
    times               = var.alarm_rule_triggered_count
  }
  period             = var.alarm_rule_period
  contact_groups     = var.alarm_rule_contact_groups
  silence_time       = var.alarm_rule_silence_time
  effective_interval = var.alarm_rule_effective_interval
}

resource "alicloud_cms_alarm" "memory_utilization" {
  count   = var.enable_alarm_rule ? 1 : 0
  enabled = var.enable_alarm_rule
  name    = var.alarm_rule_name
  project = local.project
  metric  = "MemoryUtilization"
  dimensions = {
    instanceId = local.this_instance_id
    device     = "/dev/vda1,/dev/vdb1"
  }
  escalations_critical {
    statistics          = var.alarm_rule_statistics
    comparison_operator = var.alarm_rule_operator
    threshold           = var.alarm_rule_threshold
    times               = var.alarm_rule_triggered_count
  }
  period             = var.alarm_rule_period
  contact_groups     = var.alarm_rule_contact_groups
  silence_time       = var.alarm_rule_silence_time
  effective_interval = var.alarm_rule_effective_interval
}

resource "alicloud_cms_alarm" "disk_utilization" {
  count   = var.enable_alarm_rule ? 1 : 0
  enabled = var.enable_alarm_rule
  name    = var.alarm_rule_name
  project = local.project
  metric  = "DiskUtilization"
  dimensions = {
    instanceId = local.this_instance_id
    device     = "/dev/vda1,/dev/vdb1"
  }
  escalations_critical {
    statistics          = var.alarm_rule_statistics
    comparison_operator = var.alarm_rule_operator
    threshold           = var.alarm_rule_threshold
    times               = var.alarm_rule_triggered_count
  }
  period             = var.alarm_rule_period
  contact_groups     = var.alarm_rule_contact_groups
  silence_time       = var.alarm_rule_silence_time
  effective_interval = var.alarm_rule_effective_interval
}

resource "alicloud_cms_alarm" "intranet_in" {
  count   = var.enable_alarm_rule ? 1 : 0
  enabled = var.enable_alarm_rule
  name    = var.alarm_rule_name
  project = local.project
  metric  = "IntranetIn"
  dimensions = {
    instanceId = local.this_instance_id
    device     = "/dev/vda1,/dev/vdb1"
  }
  escalations_critical {
    statistics          = var.alarm_rule_statistics
    comparison_operator = var.alarm_rule_operator
    threshold           = var.alarm_rule_threshold
    times               = var.alarm_rule_triggered_count
  }
  period             = var.alarm_rule_period
  contact_groups     = var.alarm_rule_contact_groups
  silence_time       = var.alarm_rule_silence_time
  effective_interval = var.alarm_rule_effective_interval
}

resource "alicloud_cms_alarm" "intranet_out" {
  count   = var.enable_alarm_rule ? 1 : 0
  enabled = var.enable_alarm_rule
  name    = var.alarm_rule_name
  project = local.project
  metric  = "IntranetOut"
  dimensions = {
    instanceId = local.this_instance_id
    device     = "/dev/vda1,/dev/vdb1"
  }
  escalations_critical {
    statistics          = var.alarm_rule_statistics
    comparison_operator = var.alarm_rule_operator
    threshold           = var.alarm_rule_threshold
    times               = var.alarm_rule_triggered_count
  }
  period             = var.alarm_rule_period
  contact_groups     = var.alarm_rule_contact_groups
  silence_time       = var.alarm_rule_silence_time
  effective_interval = var.alarm_rule_effective_interval
}