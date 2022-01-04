variable "log_group_names" {
  description = "-"
  type        = set(string)
}

variable "retention_in_days" {
  description = "-"
  type        = number
  default     = 0
}

variable "kms_key_id" {
  description = "-"
  type        = string
  default     = null
}

variable "tags" {
  description = "-"
  type        = map(string)
  default     = {}
}
