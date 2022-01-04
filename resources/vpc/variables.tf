variable "vpc_name" {
  description = "-"
  type        = string
}

variable "cidr_block" {
  description = "-"
  type        = string
}

variable "enable_dns_support" {
  description = "-"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "-"
  type        = bool
  default     = true
}

variable "instance_tenancy" {
  description = "-"
  type        = string
  default     = "default"
}

variable "tags" {
  description = "-"
  type        = map(string)
  default     = {}
}
