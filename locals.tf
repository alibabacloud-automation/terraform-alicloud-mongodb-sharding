locals {
  #instance
  this_instance_id = var.existing_instance_id != "" ? var.existing_instance_id : concat(alicloud_mongodb_sharding_instance.this.*.id, [""])[0]
}
