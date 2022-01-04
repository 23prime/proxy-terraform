variable "vpc_id" {
  description = "-"
  type        = string
}

variable "subnets" {
  description = "-"
  type        = list(map(string))
  default     = []
}

variable "map_public_ip_on_launch" {
  description = "-"
  type        = string
  default     = false
}

variable "tags" {
  description = "-"
  type        = map(string)
  default     = {}
}
