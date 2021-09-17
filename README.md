Terraform module which creates MongoDB Sharding instance on Alibaba Cloud  
terraform-alicloud-mongodb-sharding
=====================================================================

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb-sharding/blob/master/README-CN.md)

Terraform module which creates MongoDB sharding instance resources on Alibaba Cloud

These types of resources are supported:

* [Alicloud_mongodb_sharding_instance](https://www.terraform.io/docs/providers/alicloud/r/mongodb_sharding_instance.html)
* [Alicloud_cms_alarm](https://www.terraform.io/docs/providers/alicloud/r/cms_alarm.html)

----------------------

## Terraform versions

This module requires Terraform 0.12 and Terraform Provider Alicloud 1.56.0+.

## Usage
-----

For new instance

```hcl
module "mongodb_sharding" {
  source = "terraform-alicloud-modules/mongodb-sharding/alicloud"
  region = "cn-shanghai"
  
   ####################
   # Mongodb Instance
   ####################
   engine_version       = "4.0"
   storage_engine       = "WiredTiger"
   name                 = "my-mongodb-sharding"
   instance_charge_type = "PostPaid"
   security_ip_list     = ["1.1.1.1", "2.2.2.2", "3.3.3.3"]
   zone_id              = "cn-shanghai-h"
   vswitch_id           = "vsw-uf6ocf31lyoqxxxxxxxxx"
   account_password     = "mongo123"
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
```

For existing instance

```hcl
module "mongodb_sharding_example" {
  source = "terraform-alicloud-modules/mongodb-sharding/alicloud"
  region = "cn-shanghai"

  ####################
  # Mongodb Instance
  ####################
  existing_instance_id = "dds-uf6eea55ddxxxxxx"

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
```

## Examples

* [complete](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb-sharding/tree/master/examples/complete)
* [using-existing-mongodb-sharding-instance](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb-sharding/tree/master/examples/using-existing-mongodb-sharding-instance)
* [using-submodule-complete](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb-sharding/tree/master/examples/using-submodule-complete)

## Modules

* [mongodb-sharding-3.4-wiredtiger](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb-sharding/tree/master/modules/mongodb-sharding-3.4-wiredtiger)
* [mongodb-sharding-4.0-wiredtiger](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb-sharding/tree/master/modules/mongodb-sharding-4.0-wiredtiger)
* [mongodb-sharding-4.2-wiredtiger](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb-sharding/tree/master/modules/mongodb-sharding-4.2-wiredtiger)

## Notes

* This module using AccessKey and SecretKey are from `profile` and `shared_credentials_file`.
If you have not set them yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.


Authors
---------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
