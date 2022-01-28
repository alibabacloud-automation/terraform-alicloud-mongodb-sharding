Terraform module which creates MongoDB Sharding instance on Alibaba Cloud  
terraform-alicloud-mongodb-sharding
=====================================================================

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb-sharding/blob/master/README-CN.md)

Terraform module which creates MongoDB sharding instance resources on Alibaba Cloud

These types of resources are supported:

* [Alicloud_mongodb_sharding_instance](https://www.terraform.io/docs/providers/alicloud/r/mongodb_sharding_instance.html)
* [Alicloud_cms_alarm](https://www.terraform.io/docs/providers/alicloud/r/cms_alarm.html)

----------------------

## Usage

For new instance

```hcl
module "mongodb_sharding" {
  source = "terraform-alicloud-modules/mongodb-sharding/alicloud"
  
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
From the version v1.3.0, the module has removed the following `provider` setting:

```hcl
provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/mongodb-sharding"
}
```

If you still want to use the `provider` setting to apply this module, you can specify a supported version, like 1.2.0:

```hcl
module "mongodb_sharding" {
  source         = "terraform-alicloud-modules/mongodb-sharding/alicloud"
  version        = "1.2.0"
  region         = "cn-shanghai"
  profile        = "Your-Profile-Name"
  engine_version = "4.0"
  storage_engine = "WiredTiger"
  // ...
}
```

If you want to upgrade the module to 1.3.0 or higher in-place, you can define a provider which same region with
previous region:

```hcl
provider "alicloud" {
  region  = "cn-shanghai"
  profile = "Your-Profile-Name"
}
module "mongodb_sharding" {
  source         = "terraform-alicloud-modules/mongodb-sharding/alicloud"
  engine_version = "4.0"
  storage_engine = "WiredTiger"
  // ...
}
```
or specify an alias provider with a defined region to the module using `providers`:

```hcl
provider "alicloud" {
  region  = "cn-shanghai"
  profile = "Your-Profile-Name"
  alias   = "sh"
}
module "mongodb_sharding" {
  source         = "terraform-alicloud-modules/mongodb-sharding/alicloud"
  providers      = {
    alicloud = alicloud.sh
  }
  engine_version = "4.0"
  storage_engine = "WiredTiger"
  // ...
}
```

and then run `terraform init` and `terraform apply` to make the defined provider effect to the existing module state.

More details see [How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

## Terraform versions

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.56.0 |


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