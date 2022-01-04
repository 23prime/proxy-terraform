variable "security_group_name" {
  description = "-"
  type        = string
}

variable "vpc_id" {
  description = "-"
  type        = string
}

variable "description" {
  description = "-"
  type        = string
  default     = "Managed by Terraform"
}

variable "ingress_rule" {
  description = "-"
  default     = {}
}

variable "egress_rule" {
  description = "-"
  default = {
    0 = {
      description              = null
      from_port                = 0,
      to_port                  = 0,
      protocol                 = "-1"
      cidr_blocks              = ["0.0.0.0/0"]
      source_security_group_id = null
    }
  }
}

variable "tags" {
  description = "-"
  type        = map(string)
  default     = {}
}
