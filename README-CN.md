 terraform-alicloud-mongodb-sharding
=====================================================================


本 Module 用于在阿里云的 VPC 下创建一个[MongoDB shrading云数据库](https://help.aliyun.com/document_detail/26558.html). 

本 Module 支持创建以下资源:

* [MongoDB sharding 数据库实例_(mongodb_sharding_instance)](https://www.terraform.io/docs/providers/alicloud/r/mongodb_sharding_instance.html)
* [CmsAlarm 云监控实例 (cms_alarm)](https://www.terraform.io/docs/providers/alicloud/r/cms_alarm.html)

## Terraform 版本

本模板要求使用版本 Terraform 0.12 和阿里云 Provider 1.56.0+。

## 用法

#### 创建新的Mongodb实例

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

### 使用已经存在的Mongodb Sharding实例

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

## 示例

* [创建 Mongodb Sharding 完整示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb-sharding/tree/master/examples/complete)
* [使用已经存在的 Mongodb Sharding 实例创建示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb-sharding/tree/master/examples/using-existing-mongodb-sharding-instance)
* [使用子模块实例创建 Mongodb Sharding 示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb-sharding/tree/master/examples/using-submodule-complete)

## 模块

* [mongodb-sharding-3.4-wiredtiger](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb-sharding/tree/master/modules/mongodb-sharding-3.4-wiredtiger)
* [mongodb-sharding-4.0-wiredtiger](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb-sharding/tree/master/modules/mongodb-sharding-4.0-wiredtiger)
* [mongodb-sharding-4.2-wiredtiger](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb-sharding/tree/master/modules/mongodb-sharding-4.2-wiredtiger)

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file` 中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置.

作者
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

许可
----
Apache 2 Licensed. See LICENSE for full details.

参考
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)


