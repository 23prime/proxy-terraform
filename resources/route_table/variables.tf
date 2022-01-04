variable "route_table_name" {
  description = "-"
  type        = string
}

variable "vpc_id" {
  description = "-"
  type        = string
}

variable "route" {
  description = "-"
  type        = list(map(string))
  default     = []
}

variable "subnet_ids" {
  description = "-"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "-"
  type        = map(string)
  default     = {}
}
