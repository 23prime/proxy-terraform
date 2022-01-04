variable "tags" {
  description = "-"
  type        = map(string)
  default = {
    env     = "prd"
    service = "proxy"
  }
}

variable "aws_account_id" {
  type    = string
  default = "678084882233"
}
