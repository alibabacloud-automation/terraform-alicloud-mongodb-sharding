############################
# mongodb_sharding_instance
############################

output "this_mongodb_sharding_instance_engine_version" {
  description = "The engine version of the MongoDB sharding instance. "
  value       = concat(alicloud_mongodb_sharding_instance.this.*.engine_version, [""])[0]
}

output "this_mongodb_sharding_instance_storage_engine" {
  description = "The storage engine used by the MongoDB sharding instance. "
  value       = concat(alicloud_mongodb_sharding_instance.this.*.storage_engine, [""])[0]
}

output "this_mongodb_sharding_instance_name" {
  description = "The name of MongoDB sharding instance. "
  value       = concat(alicloud_mongodb_sharding_instance.this.*.name, [""])[0]
}

output "this_mongodb_sharding_instance_charge_type" {
  description = "The billing method of the MongoDB sharding instance. "
  value       = concat(alicloud_mongodb_sharding_instance.this.*.instance_charge_type, [""])[0]
}

output "this_mongodb_sharding_instance_period" {
  description = "The duration that you will buy MongoDB sharding instance. "
  value       = concat(alicloud_mongodb_sharding_instance.this.*.period, [""])[0]
}

output "this_mongodb_sharding_instance_zone_id" {
  description = "The Zone to launch the MongoDB sharding instance. "
  value       = concat(alicloud_mongodb_sharding_instance.this.*.zone_id, [""])[0]
}

output "this_mongodb_sharding_instance_vswitch_id" {
  description = "The virtual switch ID to launch MongoDB sharding instances in one VPC. "
  value       = concat(alicloud_mongodb_sharding_instance.this.*.vswitch_id, [""])[0]
}

output "this_mongodb_sharding_instance_security_ip_list" {
  description = "IP whitelist of MongoDB sharding instances. "
  value       = alicloud_mongodb_sharding_instance.this.*.security_ip_list
}

output "this_mongodb_sharding_instance_mongo_list" {
  description = "The mongo-node count can be purchased. "
  value       = alicloud_mongodb_sharding_instance.this.*.mongo_list
}

output "this_mongodb_sharding_instance_shard_list" {
  description = "MongoDB sharding Instance backup period. "
  value       = alicloud_mongodb_sharding_instance.this.*.shard_list
}

output "this_mongodb_sharding_instance_backup_period" {
  description = "MongoDB sharding instance backup time. "
  value       = alicloud_mongodb_sharding_instance.this.*.backup_period
}

output "this_mongodb_sharding_instance_backup_time" {
  description = "MongoDB sharding instance backup time. "
  value       = concat(alicloud_mongodb_sharding_instance.this.*.backup_time, [""])[0]
}

