#################
# Provider
#################

variable "profile" {
  description = "The profile name as set in the shared credentials file. If not set, it will be sourced from the ALICLOUD_PROFILE environment variable. "
  type        = string
  default     = ""
}

variable "shared_credentials_file" {
  description = "This is the path to the shared credentials file. If this is not set and a profile is specified, $HOME/.aliyun/config.json will be used. "
  type        = string
  default     = ""
}

variable "region" {
  description = "The region used to launch this module resources. "
  type        = string
  default     = ""
}

variable "skip_region_validation" {
  description = "Skip static validation of region ID. Used by users of alternative AlibabaCloud-like APIs or users w/ access to regions that are not public (yet). "
  type        = bool
  default     = false
}

############################
# mongodb_sharding_instance
############################

variable "name" {
  description = "The name of DB instance. It a string of 2 to 256 characters. "
  type        = string
  default     = ""
}

variable "instance_charge_type" {
  description = "The billing method of the instance. Valid values are Prepaid, PostPaid, Default to PostPaid. "
  type        = string
  default     = "PostPaid"
}

variable "period" {
  description = "The duration that you will buy DB instance (in month). It is valid when instance_charge_type is PrePaid. Valid values: [1~9], 12, 24, 36. System default to 1. "
  type        = number
  default     = 1
}

variable "zone_id" {
  description = "The Zone to launch the DB instance. MongoDB sharding instance does not support multiple-zone. If it is a multi-zone and vswitch_id is specified, the vswitch must in one of them. "
  type        = string
  default     = ""
}

variable "vswitch_id" {
  description = "The virtual switch ID to launch DB instances in one VPC. "
  type        = string
  default     = ""
}

variable "account_password" {
  description = "Password of the root account. It is a string of 6 to 32 characters and is composed of letters, numbers, and underlines. "
  type        = string
  default     = ""
}

variable "security_ip_list" {
  description = "List of IP addresses allowed to access all databases of an instance. The list contains up to 1,000 IP addresses, separated by commas. Supported formats include 0.0.0.0/0, 10.23.12.24 (IP), and 10.23.12.24/24 (Classless Inter-Domain Routing (CIDR) mode. /24 represents the length of the prefix in an IP address. The range of the prefix length is [1,32]). System default to [`127.0.0.1`]. "
  type        = list(string)
  default     = []
}


variable "mongo_list" {
  description = "The mongo-node count can be purchased is in range of [2, 32]. "
  type        = list(map(any))
  default     = []
}

variable "shard_list" {
  description = "The shard-node count can be purchased is in range of [2, 32]. "
  type        = list(map(any))
  default     = []
}

variable "backup_period" {
  description = "MongoDB sharding Instance backup period. It is required when backup_time was existed. Valid values: [Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday]. Default to [Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday] "
  type        = list(string)
  default     = []
}

variable "backup_time" {
  description = "MongoDB sharding instance backup time. It is required when backup_period was existed. In the format of HH:mmZ- HH:mmZ. Time setting interval is one hour. If not specified, the system will generate a default, like `23:00Z-24:00Z`. "
  type        = string
  default     = ""
}

variable "existing_instance_id" {
  description = "The Id of an existing Mongodb sharding instance. If set, the `create` will be ignored. "
  type        = string
  default     = ""
}

variable "create" {
  description = "Whether to use an existing MongoDB sharding. If false, you can use a existing Mongodb sharding instance by setting `existing_instance_id`. "
  type        = bool
  default     = true
}