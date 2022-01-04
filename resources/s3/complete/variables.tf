variable "acceleration_status" {
  type    = string
  default = null
}

variable "acl" {
  type    = string
  default = "private"
}

variable "bucket" {
  type = string
}

variable "cors_rule" {
  type    = any
  default = []
}

variable "force_destroy" {
  type    = bool
  default = false
}

variable "lifecycle_rule" {
  type    = any
  default = []
}

variable "logging" {
  type    = list(map(string))
  default = []
}

variable "request_payer" {
  type    = string
  default = "BucketOwner"
}

variable "server_side_encryption_configuration" {
  type    = any
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "versioning_enabled" {
  type    = bool
  default = false
}

variable "versioning_mfa_delete" {
  type    = bool
  default = false
}

variable "block_public_acls" {
  type    = bool
  default = true
}

variable "block_public_policy" {
  type    = bool
  default = true
}

variable "ignore_public_acls" {
  type    = bool
  default = true
}

variable "restrict_public_buckets" {
  type    = bool
  default = true
}

variable "create_s3_bucket_policy" {
  type    = bool
  default = false
}

variable "policy_document" {
  type    = string
  default = null
}

variable "policy_parameters" {
  type    = map(string)
  default = {}
}

variable "create_s3_bucket_notification" {
  type    = bool
  default = false
}

variable "lambda_function" {
  type    = any
  default = []
}

variable "objects" {
  type    = map(any)
  default = {}
}
