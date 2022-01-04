variable "role_name" {
  description = "-"
  type        = string
  default     = null
}

variable "service" {
  description = ""
  type        = string
  default     = null
}

variable "role_document" {
  description = "-"
  type        = string
}

variable "role_parameters" {
  description = "-"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "-"
  type        = map(string)
  default     = {}
}

variable "policies" {
  description = "-"
  type        = list(string)
  default     = []
}

variable "create_aws_iam_role_policy" {
  description = "-"
  type        = bool
  default     = false
}

variable "policy_name" {
  description = "-"
  type        = string
  default     = null
}

variable "policy_document" {
  description = "-"
  type        = string
  default     = null
}

variable "policy_parameters" {
  description = "-"
  type        = map(string)
  default     = {}
}

variable "create_iam_instance_profile" {
  description = "-"
  type        = bool
  default     = false
}

variable "profile_name" {
  description = "-"
  type        = string
  default     = null
}
