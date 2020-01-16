Terraform module which creates MongoDB Sharding instance on Alibaba Cloud

 terraform-alicloud-mongodb-sharding
=====================================================================

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb_sharding/blob/master/README-CN.md)

Terraform module which creates MongoDB sharding instance resources on Alibaba Cloud

These types of resources are supported:

* [Alicloud_mongodb_sharding_instance](https://www.terraform.io/docs/providers/alicloud/r/mongodb_sharding_instance.html)

----------------------

## Terraform versions

This module requires Terraform 0.12.

## Usage
-----
You can use this in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. main.tf

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

## Examples

* [MongoDB sharding_example](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb_sharding/tree/master/examples/mongodb_sharding)

## Module

* [mongodb-sharding-3.4-wiredtiger](https://github.com/terraform-alicloud-mongodb_sharding/tree/mongodb/modules/mongodb-sharding-3.4-wiredtiger)
* [mongodb-sharding-4.0-wiredtiger](https://github.com/terraform-alicloud-mongodb_sharding/tree/mongodb/modules/mongodb-sharding-4.0-wiredtiger)
* [mongodb-sharding-4.2-wiredtiger](https://github.com/terraform-alicloud-mongodb_sharding/tree/mongodb/modules/mongodb-sharding-4.2-wiredtiger)

## Notes

* This module using AccessKey and SecretKey are from `profile` and `shared_credentials_file`.
If you have not set them yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.


Authors
---------
Created and maintained by Yi Jincheng(yi785301535@163.com), He Guimin(@xiaozhu36, heguimin36@163.com)

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
