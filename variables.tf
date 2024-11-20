
############################
# mongodb_sharding_instance
############################
variable "create" {
  description = "Whether to use an existing MongoDB sharding. If false, you can use a existing Mongodb sharding instance by setting `existing_instance_id`. "
  type        = bool
  default     = true
}

variable "existing_instance_id" {
  description = "The Id of an existing Mongodb sharding instance. If set, the `create` will be ignored. "
  type        = string
  default     = ""
}

variable "name" {
  description = "The name of DB instance. It a string of 2 to 256 characters. "
  type        = string
  default     = ""
}

variable "engine_version" {
  description = "The version number of the database. Valid value: 3.4, 4.0, 4.2, 4.4, 5.0. "
  type        = string
  default     = "3.4"
}

variable "storage_engine" {
  description = "Storage engine: WiredTiger or RocksDB. System Default value: WiredTiger. "
  type        = string
  default     = "WiredTiger"
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

variable "backup_period" {
  description = "MongoDB sharding Instance backup period. It is required when backup_time was existed. Valid values: [Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday]. Default to [Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday] "
  type        = list(any)
  default     = []
}

variable "backup_time" {
  description = "MongoDB sharding instance backup time. It is required when backup_period was existed. In the format of HH:mmZ- HH:mmZ. Time setting interval is one hour. If not specified, the system will generate a default, like `23:00Z-24:00Z`. "
  type        = string
  default     = ""
}

variable "mongo_list" {
  description = "The mongo-node count can be purchased is in range of [2, 32]. "
  type        = list(map(string))
  default     = []
}

variable "shard_list" {
  description = "The shard-node count can be purchased is in range of [2, 32]. "
  type        = list(map(string))
  default     = []
}

#############
# cms_alarm
#############
variable "enable_alarm_rule" {
  description = "Whether to enable alarm rule. Default to true. "
  type        = bool
  default     = true
}

variable "alarm_rule_name" {
  description = "The alarm rule name. "
  type        = string
  default     = ""
}

variable "alarm_rule_statistics" {
  description = "Statistical method. It must be consistent with that defined for metrics. Valid values: ['Average', 'Minimum', 'Maximum']. Default to 'Average'. "
  type        = string
  default     = "Average"
}

variable "alarm_rule_operator" {
  description = "Alarm comparison operator. Valid values: ['<=', '<', '>', '>=', '==', '!=']. Default to '=='. "
  type        = string
  default     = ">="
}

variable "alarm_rule_threshold" {
  description = "Alarm threshold value, which must be a numeric value currently. "
  type        = string
  default     = ""
}

variable "alarm_rule_triggered_count" {
  description = "Number of consecutive times it has been detected that the values exceed the threshold. Default to 3. "
  type        = number
  default     = 3
}

variable "alarm_rule_period" {
  description = "Index query cycle, which must be consistent with that defined for metrics. Default to 300, in seconds. "
  type        = number
  default     = 300
}

variable "alarm_rule_contact_groups" {
  description = "List contact groups of the alarm rule, which must have been created on the console. "
  type        = list(string)
  default     = []
}

variable "alarm_rule_silence_time" {
  description = "Notification silence period in the alarm state, in seconds. Valid value range: [300, 86400]. Default to 86400. "
  type        = number
  default     = 86400
}

variable "alarm_rule_effective_interval" {
  description = "The interval of effecting alarm rule. It foramt as 'hh:mm-hh:mm', like '0:00-4:00'."
  type        = string
  default     = "0:00-2:00"
}