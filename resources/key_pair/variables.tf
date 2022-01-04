variable "key_name" {
  description = "-"
  type        = string
}

variable "public_key" {
  description = "-"
  type        = string
}

variable "tags" {
  description = "-"
  type        = map(string)
  default     = {}
}
