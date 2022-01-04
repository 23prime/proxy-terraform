variable "ami" {
  description = "-"
  type        = string
}

variable "associate_public_ip_address" {
  description = "-"
  type        = bool
  default     = false
}

variable "iam_instance_profile" {
  description = "-"
  type        = string
  default     = null
}

variable "instance_type" {
  description = "-"
  type        = string
}

variable "instances" {
  description = "-"
  type        = number
}

variable "key_name" {
  description = "-"
  type        = string
  default     = null
}

variable "name" {
  description = "-"
  type        = string
}

variable "private_ip" {
  description = "-"
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "-"
  type        = string
  default     = null
}

variable "tags" {
  description = "-"
  type        = map(string)
  default     = {}
}

variable "vpc_security_group_ids" {
  description = "-"
  type        = list(string)
  default     = []
}

variable "user_data" {
  description = "-"
  type        = string
  default     = null
}

variable "delete_on_termination" {
  description = "-"
  type        = bool
  default     = true
}

variable "encrypted" {
  description = "-"
  type        = bool
  default     = false
}

variable "volume_size" {
  description = "-"
  type        = number
  default     = null
}

variable "volume_type" {
  description = "-"
  type        = string
  default     = "gp3"
}

variable "create_eip" {
  description = "-"
  type        = bool
  default     = false
}

variable "eip_name" {
  description = "-"
  type        = string
  default     = null
}

variable "vpc" {
  description = "-"
  type        = bool
  default     = true
}

variable "eip_ids" {
  description = "-"
  type        = list(string)
  default     = []
}

variable "create_eip_association" {
  description = "-"
  type        = bool
  default     = false
}
