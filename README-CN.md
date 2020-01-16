Terraform module which creates MongoDB Sharding instance on Alibaba Cloud

 terraform-alicloud-mongodb-sharding
=====================================================================


本 Module 用于在阿里云的 VPC 下创建一个[MongoDB shrading云数据库](https://help.aliyun.com/document_detail/26558.html). 

本 Module 支持创建以下资源:

* [MongoDB sharding 数据库实例_(mongodb_sharding_instance)](https://www.terraform.io/docs/providers/alicloud/r/mongodb_sharding_instance.html)

## Terraform 版本

本模板要求使用版本 Terraform 0.12。

## 用法

```hcl
module "mongodb_sharding_example" {
  source = "terraform-alicloud-modules/mongodb_sharding/alicloud"
  region = var.region
  engine_version       = "3.4"
  storage_engine       = "WiredTiger"
  name                 = "my-mongodb-sharding"
  instance_charge_type = "PostPaid"
  zone_id              = "cn-shanghai-h"
  vswitch_id           = "vsw-uf6ocf31lyoqxxxxxxxxx"
  account_password     = "shard123456"
  security_ip_list     = ["1.1.1.1", "2.2.2.2", "3.3.3.3"]
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
}
```

## 示例

* [MongoDB sharding 实例完整创建示例创建示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb_sharding/tree/master/examples/mongodb_sharding)

## 模块

* [mongodb-sharding-3.4-wiredtiger](https://github.com/terraform-alicloud-mongodb_sharding/tree/mongodb/modules/mongodb-sharding-3.4-wiredtiger)
* [mongodb-sharding-4.0-wiredtiger](https://github.com/terraform-alicloud-mongodb_sharding/tree/mongodb/modules/mongodb-sharding-4.0-wiredtiger)
* [mongodb-sharding-4.2-wiredtiger](https://github.com/terraform-alicloud-mongodb_sharding/tree/mongodb/modules/mongodb-sharding-4.2-wiredtiger)

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file` 中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置.

作者
-------
Created and maintained by Yi Jincheng(yi785301535@163.com), He Guimin(@xiaozhu36, heguimin36@163.com)

许可
----
Apache 2 Licensed. See LICENSE for full details.

参考
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)


