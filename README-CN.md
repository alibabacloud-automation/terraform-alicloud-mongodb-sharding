 terraform-alicloud-mongodb-sharding
=====================================================================


本 Module 用于在阿里云的 VPC 下创建一个[MongoDB shrading云数据库](https://help.aliyun.com/document_detail/26558.html). 

本 Module 支持创建以下资源:

* [MongoDB sharding 数据库实例_(mongodb_sharding_instance)](https://www.terraform.io/docs/providers/alicloud/r/mongodb_sharding_instance.html)
* [CmsAlarm 云监控实例 (cms_alarm)](https://www.terraform.io/docs/providers/alicloud/r/cms_alarm.html)

## 用法

#### 创建新的Mongodb实例

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

### 使用已经存在的Mongodb Sharding实例

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

## 示例

* [创建 Mongodb Sharding 完整示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb-sharding/tree/master/examples/complete)
* [使用已经存在的 Mongodb Sharding 实例创建示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb-sharding/tree/master/examples/using-existing-mongodb-sharding-instance)
* [使用子模块实例创建 Mongodb Sharding 示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb-sharding/tree/master/examples/using-submodule-complete)

## 模块

* [mongodb-sharding-3.4-wiredtiger](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb-sharding/tree/master/modules/mongodb-sharding-3.4-wiredtiger)
* [mongodb-sharding-4.0-wiredtiger](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb-sharding/tree/master/modules/mongodb-sharding-4.0-wiredtiger)
* [mongodb-sharding-4.2-wiredtiger](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb-sharding/tree/master/modules/mongodb-sharding-4.2-wiredtiger)

## 注意事项
本Module从版本v1.3.0开始已经移除掉如下的 provider 的显式设置：

```hcl
provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/mongodb-sharding"
}
```

如果你依然想在Module中使用这个 provider 配置，你可以在调用Module的时候，指定一个特定的版本，比如 1.2.0:

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

如果你想对正在使用中的Module升级到 1.3.0 或者更高的版本，那么你可以在模板中显式定义一个相同Region的provider：
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
或者，如果你是多Region部署，你可以利用 `alias` 定义多个 provider，并在Module中显式指定这个provider：

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

定义完provider之后，运行命令 `terraform init` 和 `terraform apply` 来让这个provider生效即可。

更多provider的使用细节，请移步[How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

## Terraform 版本

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.56.0 |

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


